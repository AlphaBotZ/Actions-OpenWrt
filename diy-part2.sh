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

# Files
chmod -R 755 files

# Cloudflare测速
git clone https://github.com/mingxiaoyu/luci-app-cloudflarespeedtest package/luci-app-cloudflarespeedtest
git clone https://github.com/immortalwrt-collections/openwrt-cdnspeedtest package/CloudflareSpeedTest

# 去广告
git clone https://github.com/rufengsuixing/luci-app-adguardhome package/luci-app-adguardhome

# 远程访问
git clone https://github.com/rufengsuixing/luci-app-zerotier package/luci-app-zerotier

# 科学上网
git clone https://github.com/xiaorouji/openwrt-passwall2 package/openwrt-passwall2
git clone https://github.com/vernesong/OpenClash package/OpenClash
git clone https://github.com/nikkinikki-org/OpenWrt-nikki package/OpenWrt-nikki
