TP-Link AC1200 Archer T4U Wireless Dual Band USB Adapter
--------------------------------------------------------

To install afresh::

	$ sudo apt-get install rtl8812au-dkms
	$ sudo service network-manager stop
	$ sudo modprobe -rfv 8812au
	$ sudo modprobe -v 8812au
	$ sudo service network-manager start
	
	$ sudo dkms status
	rtl8812au, 4.3.8.12175.20140902+dfsg, 4.4.0-66-generic, x86_64: installed

At this point the driver is installed and loaded. Next see if any wireless devices are visible::

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
	$ sudo ifconfig
	enx8416f91b54ee Link encap:Ethernet  HWaddr 84:16:f9:1b:54:ee  
          UP BROADCAST MULTICAST  MTU:1500  Metric:1
          RX packets:0 errors:0 dropped:0 overruns:0 frame:0
          TX packets:0 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1000 
          RX bytes:0 (0.0 B)  TX bytes:0 (0.0 B)

To see available access points::

	$ sudo iwlist enx8416f91b54ee scan

To recompile on kernel update::

	$ dkms status
	$ sudo dkms remove rtl8812au/4.3.8.12175.20140902+dfsg -k $(uname -r)
	$ sudo dkms install rtl8812au/4.3.8.12175.20140902+dfsg
	$ sudo modprobe 8812au
