#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# Modify default IP
#sed -i 's/192.168.1.1/192.168.50.5/g' package/base-files/files/bin/config_generate
#rm -rf package/lean/luci-theme-argon
# 修改openwrt登陆地址,把下面的192.168.31.1修改成你想要的就可以了
#sed -i 's/192.168.1.1/192.168.31.1/g' package/base-files/files/bin/config_generate

# 修改主机名字，把YOU-R4A修改你喜欢的就行（不能纯数字或者使用中文）
sed -i '/uci commit system/i\uci set system.@system[0].hostname='MiR4A'' package/lean/default-settings/files/zzz-default-settings

# 版本号里显示一个自己的名字（ababwnq build $(TZ=UTC-8 date "+%Y.%m.%d") @ 这些都是后增加的）
sed -i 's/OpenWrt /编译时间 $(TZ=UTC-8 date "+%Y.%m.%d")/g' package/lean/default-settings/files/zzz-default-settings

#更改主机型号，支持中文。 
sed -i "s/KERNEL_PATCHVER:=5.4/KERNEL_PATCHVER:=5.10/g" target/linux/ramips/Makefile

# 设置密码为空（安装固件时无需密码登陆，然后自己修改想要的密码）
sed -i 's@.*CYXluq4wUazHjmCDBCqXF*@#&@g' package/lean/default-settings/files/zzz-default-settings

# 修改默认wifi名称ssid为XXKDB
sed -i 's/ssid=OpenWrt/ssid=MIWIFI/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh

# 修改默认wifi密码key为password
sed -i 's/encryption=none/encryption=psk2/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh
#使用sed 在第四行后添加新字
#sed -e 120a\set wireless.default_radio${devidx}.key=password package/kernel/mac80211/files/lib/wifi/mac80211.sh
sed -i '/set wireless.default_radio${devidx}.encryption=psk2/a\set wireless.default_radio${devidx}.key=Password' package/kernel/mac80211/files/lib/wifi/mac80211.sh

