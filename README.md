# How to install OpenWrt on KuWfi 830 / Yuncore 830

## Option 1

Flash instruction under vendor firmware:

1. Connect PC with 192.168.188.x address to LAN port
2. Power up device normally and go to http://192.168.188.253
3. Choose "upgrade" in the GUI and upload the firmware provided here : https://github.com/grosjo/OpenWrt-Kuwfi-CPE830D/blob/master/CPE830-OPENWRT-AP-V2.0-Build20190118101609-EN.ubin
4. Reboot -> Root password is now '' (empty)
5. Download https://downloads.openwrt.org/releases/18.06.4/targets/ar71xx/generic/openwrt-18.06.4-ar71xx-generic-ap147-010-squashfs-sysupgrade.bin
6. Install a TFTP server on your PC ('atftp' is doing the job for instance)
7. Telnet to 192.168.188.253 as root (no password) and invoke:
- cd /tmp
- tftp -g -r openwrt-18.06.4-ar71xx-generic-ap147-010-squashfs-sysupgrade.bin -l upgrade.bin 192.168.188.x (replace x by your IP)
- fw_setenv bootcmd "bootm 0x9fe80000 || bootm 0x9f050000"
- fw_setenv bootargs "console=ttyS0,115200 rootfstype=squashfs,jffs2 noinitrd"
- mtd -e firmware -r write upgrade.bin firmware
8. Device shall be booting on 192.168.1.1 as default


## Option 2

Compiling your own firmware

Here is the script to compile :<br />
https://github.com/grosjo/OpenWrt-Kuwfi-CPE830/blob/master/compile_kuwfi830.sh

The file "config_kuwfi830 is :<br />
https://github.com/grosjo/OpenWrt-Kuwfi-CPE830/blob/master/config_kuwfi830<br />
(You may change it as you wish)

A pre-compiled version (Oct 2019) is here :<br />
https://github.com/grosjo/OpenWrt-Kuwfi-CPE830/blob/master/upgrade.bin

1. Connect PC with 192.168.0.141 to WAN port
2. Install a TFTP server on your PC ('atftp' is doing the job for instance)
3. Copy ./bin/targets/ath79/generic/openwrt-ath79-generic-yuncore_cpe830-squashfs-tftp.bin in the TFTP folder as upgrade.bin
4. Power up device pushing the 'reset' button
5. The device shall upload upgrade.bin, install it and reboot
6. Device shall be booting on 192.168.1.1 as default on LAN port (note : you need to change your cable from WAN to LAN)
