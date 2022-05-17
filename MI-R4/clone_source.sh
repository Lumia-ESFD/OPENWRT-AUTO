#!/bin/bash
cd ${GITHUB_WORKSPACE}/

git clone -b master --single-branch https://github.com/Lienol/openwrt OpenWRT
mkdir -p OpenWRT/package/myapps

cd ${GITHUB_WORKSPACE}/OpenWRT/package/myapps

git clone https://github.com/jerrykuku/luci-theme-argon.git
git clone https://github.com/jerrykuku/luci-app-argon-config.git
git clone https://github.com/jerrykuku/luci-app-vssr.git
git clone https://github.com/jerrykuku/lua-maxminddb.git
git clone https://github.com/Ausaci/luci-app-nat6-helper.git
svn co https://github.com/vernesong/OpenClash/trunk/luci-app-openclash
git clone -b packages --single-branch https://github.com/xiaorouji/openwrt-passwall.git
git clone -b luci --single-branch https://github.com/xiaorouji/openwrt-passwall.git luci-app-passwall