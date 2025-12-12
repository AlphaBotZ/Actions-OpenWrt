#!/bin/bash
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#
# Copyright (c) 2019-2024 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#

# Modify default IP
#sed -i 's/192.168.1.1/192.168.50.5/g' package/base-files/files/bin/config_generate

# Modify default theme
#sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile

# Modify hostname
#sed -i 's/OpenWrt/P3TERX-Router/g' package/base-files/files/bin/config_generate

# Files大法文件权限
chmod -R 755 files
set -e

sed -i '$a src-git smpackage https://github.com/kenzok8/small-package' feeds.conf.default
rm -rf feeds/smpackage/{base-files,dnsmasq,firewall*,fullconenat,libnftnl,nftables,ppp,opkg,ucl,upx,vsftpd*,miniupnpd-iptables,wireless-regdb}

# ===== helloworld =====
# rm -rf feeds/packages/net/{xray-core,v2ray-core,v2ray-geodata,sing-box}
# git clone https://github.com/sbwml/openwrt_helloworld.git package/helloworld

# ===== Theme =====
rm -rf package/lean/luci-theme-argon
git clone https://github.com/jerrykuku/luci-theme-argon.git package/luci-theme-argon
git clone https://github.com/jerrykuku/luci-app-argon-config.git package/luci-app-argon-config

# ===== Community Applications =====
git clone https://github.com/mingxiaoyu/luci-app-cloudflarespeedtest.git package/luci-app-cloudflarespeedtest
git clone https://github.com/immortalwrt-collections/openwrt-cdnspeedtest.git package/openwrt-cdnspeedtest
git clone https://github.com/destan19/OpenAppFilter.git package/OpenAppFilter
git clone https://github.com/rufengsuixing/luci-app-zerotier.git package/luci-app-zerotier
git clone https://github.com/nikkinikki-org/OpenWrt-nikki package/OpenWrt-nikki
git clone https://github.com/sbwml/luci-app-openlist2 package/openlist
git clone https://github.com/sbwml/luci-app-mosdns package/mosdns

# 集成自定义 LuCI 包
[ -d "$GITHUB_WORKSPACE/luci-app-github-update" ] && \
mv $GITHUB_WORKSPACE/luci-app-github-update openwrt/package/
echo "CONFIG_PACKAGE_luci-app-github-update=y" >> openwrt/.config
