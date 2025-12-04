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

# ===== AdGuardHome / Dockerman =====
git clone https://github.com/kenzok8/small-package.git package/small-package-temp
mv package/small-package-temp/luci-app-adguardhome package/luci-app-adguardhome
mv package/small-package-temp/luci-app-dockerman package/luci-app-dockerman
rm -rf package/small-package-temp

# ===== helloworld =====
rm -rf feeds/packages/net/{xray-core,v2ray-core,v2ray-geodata,sing-box}
git clone https://github.com/sbwml/openwrt_helloworld.git package/helloworld

# 更新 golang 1.25 版本
rm -rf feeds/packages/lang/golang
git clone https://github.com/sbwml/packages_lang_golang -b 25.x feeds/packages/lang/golang

# ===== CloudflareSpeedTest =====
git clone https://github.com/mingxiaoyu/luci-app-cloudflarespeedtest.git package/luci-app-cloudflarespeedtest

# ===== CDN SpeedTest =====
git clone https://github.com/immortalwrt-collections/openwrt-cdnspeedtest.git package/openwrt-cdnspeedtest

# ===== ZeroTier =====
git clone https://github.com/rufengsuixing/luci-app-zerotier.git package/luci-app-zerotier

# ===== OpenAppFilter =====
git clone https://github.com/destan19/OpenAppFilter.git package/OpenAppFilter

# ===== Theme =====
rm -rf package/lean/luci-theme-argon
git clone https://github.com/jerrykuku/luci-theme-argon.git package/luci-theme-argon
git clone https://github.com/jerrykuku/luci-app-argon-config.git package/luci-app-argon-config
