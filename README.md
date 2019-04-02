# How to install OpenWrt on Yuncore/KuWfi 830


Flash instruction under vendor firmware:

1. Connect PC with 192.168.188.x address to LAN port
2. Power up device normally
3. Choose "upgrade" in the GUI and upload the firmware provided here : https://github.com/grosjo/OpenWrt-Yuncore-Kuwfi-CPE830D/blob/master/CPE830-OPENWRT-AP-V2.0-Build20190118101609-EN.ubin
4. Reboot -> Root password is now '' (empty)
5. Upload https://downloads.openwrt.org/releases/18.06.2/targets/ar71xx/generic/openwrt-18.06.2-ar71xx-generic-cpe830-squashfs-sysupgrade.bin to /tmp using SCP or Netcat or TFTP
6. Connect PC with 192.168.188.x address to LAN port, SSH / Telnet to 192.168.188.253 as root
7. Invoke:
- cd /tmp
- fw_setenv bootcmd "bootm 0x9fe80000 || bootm 0x9f050000"
- fw_setenv bootargs "console=ttyS0,115200 rootfstype=squashfs,jffs2 noinitrd"
- mtd -e firmware -r write openwrt-18.06.2-ar71xx-generic-cpe830-squashfs-sysupgrade.bin firmware
8. Device shall be booting on 192.168.1.1 as default
