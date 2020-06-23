#!/bin/bash
rm -rf kuwfi830
git clone https://git.openwrt.org/openwrt/openwrt.git kuwfi830
rm 3133.patch
wget https://patch-diff.githubusercontent.com/raw/openwrt/openwrt/pull/3133.patch
cp config_kuwfi830 kuwfi830/.config
cd kuwfi830
patch -p1 < ../3133.patch
./scripts/feeds update -a
./scripts/feeds install -a
cd ..
cp config_kuwfi830 kuwfi830/.config
chown -R admin:admin kuwfi830
cd kuwfi830
sudo -u admin make defconfig
sudo -u admin make -j16 download
sudo -u admin make -j16
cd ..
gzip -9 kuwfi830/bin/targets/ath79/generic/openwrt-ath79-generic-yuncore_cpe830-squashfs-sysupgrade.bin
mv kuwfi830/bin/targets/ath79/generic/openwrt-ath79-generic-yuncore_cpe830-squashfs-sysupgrade.bin.gz WHEREYOUWANT
