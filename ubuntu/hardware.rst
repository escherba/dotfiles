TP-Link AC1200 Archer T4U Wireless Dual Band USB Adapter
--------------------------------------------------------

To install afresh:
	$ sudo apt-get install rtl8812au-dkms
	$ sudo service network-manager stop
	$ sudo modprobe -rfv 8812au
	$ sudo modprobe -v 8812au
	$ sudo service network-manager start
	$ sudo dkms status
	rtl8812au, 4.3.8.12175.20140902+dfsg, 4.4.0-31-generic, x86_64: installed

To recompile on kernel update:
	$ dkms status
	$ sudo dkms remove rtl8812au/4.3.8.12175.20140902+dfsg -k $(uname -r)
	$ sudo dkms install rtl8812au/4.3.8.12175.20140902+dfsg
	$ sudo modprobe 8812au
