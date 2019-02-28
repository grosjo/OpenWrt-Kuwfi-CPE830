# How to install OpenWrt on Yuncore/KuWfi 830


Flash instruction under vendor firmware:

1. Connect PC with 192.168.1.x address to WAN port
2. Power up device normally
3. Choose "upgrade" and upload the firmware provided <a href='https://github.com/grosjo/OpenWrt-Yuncore-Kuwfi-CPE830D/blob/master/CPE830-OPENWRT-AP-V2.0-Build20190118101609-EN.ubin'>on this repo</a>
4. Reboot. Root password is '' (empty)
5. Upload https://downloads.openwrt.org/releases/18.06.2/targets/ar71xx/generic/openwrt-18.06.2-ar71xx-generic-cpe830-squashfs-sysupgrade.bin to /tmp using SCP
6. Connect PC with 192.168.188.x address to LAN port, SSH to 192.168.188.253
7. Invoke:
- cd /tmp
- fw_setenv bootcmd "bootm 0x9f050000"
- mtd erase firmware
- mtd -r write openwrt-18.06.2-ar71xx-generic-cpe830-squashfs-sysupgrade.bin firmware
