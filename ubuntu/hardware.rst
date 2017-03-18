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
	$ iwconfig
	enx8416f91b54ee  unassociated  Nickname:"<WIFI@REALTEK>"
          Mode:Managed  Frequency=2.412 GHz  Access Point: Not-Associated   
          Sensitivity:0/0  
          Retry:off   RTS thr:off   Fragment thr:off
          Power Management:off
          Link Quality:0  Signal level:0  Noise level:0
          Rx invalid nwid:0  Rx invalid crypt:0  Rx invalid frag:0
          Tx excessive retries:0  Invalid misc:0   Missed beacon:0

	lo        no wireless extensions.

	enp5s0    no wireless extensions.

	eno1      no wireless extensions.


To recompile on kernel update::

	$ dkms status
	$ sudo dkms remove rtl8812au/4.3.8.12175.20140902+dfsg -k $(uname -r)
	$ sudo dkms install rtl8812au/4.3.8.12175.20140902+dfsg
	$ sudo modprobe 8812au
