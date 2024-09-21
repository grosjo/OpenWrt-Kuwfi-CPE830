#!/bin/bash
rm -rf kuwfi830
git clone https://git.openwrt.org/openwrt/openwrt.git kuwfi830

rm openwrt.patch
wget https://patch-diff.githubusercontent.com/raw/openwrt/openwrt/pull/15969.diff -O openwrt.patch

cp config_kuwfi830 kuwfi830/.config
cd kuwfi830
echo "Patching"
patch -p1 < ../openwrt.patch

./scripts/feeds update -a 
./scripts/feeds install -a 
cd ..
cp config_kuwfi830 kuwfi830/.config
chown -R admin:admin kuwfi830
cd kuwfi830

sudo -u admin make defconfig
sudo -u admin make -j 16 download
sudo -u admin make -j 16
cd ..
mv kuwfi830/bin/targets/ath79/generic/openwrt-ath79-generic-yuncore_cpe830-squashfs-sysupgrade.bin /WHEREYOUWANT/
mv kuwfi830/bin/targets/ath79/generic/openwrt-ath79-generic-yuncore_cpe830-squashfs-tftp.bin /WHEREYOUWANT/
