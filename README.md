# OpenWrt-Yuncore-Kuwfi-CPE830D
How to install OpenWrt on Yuncore/KuWfi 830


Flash instruction under vendor fimrware, using telnet/SSH:

1. Connect PC with 192.168.1.x address to WAN port
2. Power up device normally
3. Choose "upgrade" and upload the firmware provided on this repo
4. Reboot. Root password is '' (empty)
5. Upload https://downloads.openwrt.org/releases/18.06.2/targets/ar71xx/generic/openwrt-18.06.2-ar71xx-generic-cpe830-squashfs-sysupgrade.bin to /tmp using SCP
6. Connect PC with 192.168.188.x address to LAN port, SSH to 192.168.188.253
7. Invoke:
- cd /tmp
- fw_setenv bootcmd "bootm 0x9f050000"
- mtd erase firmware
- mtd -r write lede-ar71xx-generic-ap90q-squashfs-sysupgrade.bin firmware
