#!/bin/bash
cd ${GITHUB_WORKSPACE}/OpenWRT/

./scripts/feeds update -a
./scripts/feeds install -a

sed -i 's/192.168.1.1/192.168.31.1/g' package/base-files/files/bin/config_generate
sed -i 's/OpenWrt/Xiaomi-Router/g' package/base-files/files/bin/config_generate

rm -rf feeds/packages/net/xray-core
rm -rf package/feeds/packages/xray-core

# mv -f ${GITHUB_WORKSPACE}/${github.event.inputs.Models}/.config ./.config
# goto start_build.sh