#!/bin/bash
rm -rf kuwfi830
git clone https://git.openwrt.org/openwrt/openwrt.git kuwfi830
rm 2297.patch
wget https://patch-diff.githubusercontent.com/raw/openwrt/openwrt/pull/2297.patch
cp config_kuwfi830 kuwfi830/.config
cd kuwfi830
patch -p1 < ../2297.patch
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
mv kuwfi830/bin/targets/ath79/generic/openwrt-ath79-generic-kuwfi_830d-squashfs-sysupgrade.bin FOLDER_WHERE_WOU_WANT
