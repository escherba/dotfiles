Wi-Fi adapters and Ubuntu Linux
===============================

The instructions below were written after setting up TP-Link AC1200 Archer T4U
Wireless Dual Band USB Adapter, but they may apply to other Wi-Fi adapters
(with corresponding corrections).

Install the drivers
-------------------

To install afresh::

	$ sudo apt-get install rtl8812au-dkms wireless-tools
	$ sudo service network-manager stop
	$ sudo modprobe -rfv 8812au
	$ sudo modprobe -v 8812au
	$ sudo service network-manager start
	
Check the status of the installation like this::

	$ dkms status
	rtl8812au, 4.3.8.12175.20140902+dfsg, 4.4.0-66-generic, x86_64: installed

At this point the driver is installed and loaded. If you want to recompile existing
build of the driver for the current kernel, first remove the build like so::

	$ sudo dkms remove rtl8812au/4.3.8.12175.20140902+dfsg -k $(uname -r)

Then install the driver (note that you don't need to specify kernel version here)::

	$ sudo dkms install rtl8812au/4.3.8.12175.20140902+dfsg
	$ sudo modprobe 8812au

Check that the device is working
--------------------------------

To see if any wireless devices are visible::

	$ iwconfig
	enx8416f91b54ee  unassociated  Nickname:"<WIFI@REALTEK>"
          Mode:Managed  Frequency=2.412 GHz  Access Point: Not-Associated   
          Sensitivity:0/0  
          Retry:off   RTS thr:off   Fragment thr:off
          Power Management:off
          Link Quality:0  Signal level:0  Noise level:0
          Rx invalid nwid:0  Rx invalid crypt:0  Rx invalid frag:0
          Tx excessive retries:0  Invalid misc:0   Missed beacon:0

If you can see output like above, you're good. Proceed to start this network interface::

	$ sudo ifconfig enx8416f91b54ee up
	$ ifconfig
	enx8416f91b54ee Link encap:Ethernet  HWaddr 84:16:f9:1b:54:ee  
          UP BROADCAST MULTICAST  MTU:1500  Metric:1
          RX packets:0 errors:0 dropped:0 overruns:0 frame:0
          TX packets:0 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1000 
          RX bytes:0 (0.0 B)  TX bytes:0 (0.0 B)

To see available access points::

	$ sudo iwlist enx8416f91b54ee scan
	
Expect to see a long list of visible Wi-Fi networks. If the list is empty except
for "No scan results" message, something went wrong (if it's an external USB device,
try unplugging it and plugging it back in).

Configure network (WPA)
-----------------------

For a WPA network (such as my Airport Extreme-based network), the configuration
relies on ``wpa_supplicant`` program. Use ``sudo apt-get install wpasupplicant``
if you don't have it. Then create a file called ``/etc/wpa.conf`` using the 
following command::

	$ sudo wpa_passphrase <NETWORK_ID> <NETWORK_PWD> > /etc/wpa.conf

then modify this file to look like this::

	network={
		ssid="<NETWORK_ID>"
		scan_ssid=1
		proto=WPA RSN
		key_mgmt=WPA-PSK
		pairwise=CCMP TKIP
		group=CCMP TKIP
		auth_alg=OPEN
		psk=<NETWORK_PWD_ENCRYPTED>
	}

(where ``<NETWORK_ID>`` is your network id and ``<NETWORK_PWD_ENCRYPTED>`` is a hexadecimal
representation of your encrypted password generated using ``wpa_passphrase``). 
For better security, restrict access permissions to this file::

	$ sudo chmod 400 /etc/wpa.conf
	
In your ``/etc/network/interfaces`` add the following lines::

	# wireless interace
	auto enx8416f91b54ee
	allow-hotplug enx8416f91b54ee
	iface enx8416f91b54ee inet dhcp
	wpa-conf /etc/wpa.conf
	
Finally, test the connection::

	$ sudo ifup enx8416f91b54ee
	
This should complete fairly quickly, and the last line should be something like
"bound to 10.0.1.11 -- renewal in 35287 seconds". If you see "No DHCPOFFERS received"
line, try to diagnose the problem using ``sudo iwlist <INTERFACE_NAME> scan`` command.

DNS and other config
--------------------

To ensure that ``/etc/resolv.conf`` is never empty (this file gets generated
automatically: don't edit the file itself), add the following lines to
``/etc/resolvconf/resolv.conf.d/tail``::

	nameserver 8.8.8.8
	nameserver 8.8.4.4

These are Google DNS servers that should have quite good availability.

To ensure that DHCP lookup on startup doesn't take too long, reduce the timeout
specified in ``/etc/dhcp/dhclient.conf`` from default 300 to something more
reasonable like 60 seconds.
