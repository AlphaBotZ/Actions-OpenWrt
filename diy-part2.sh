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

#!/bin/bash
set -e

# ===== OpenClash =====
git clone https://github.com/vernesong/OpenClash.git package/openclash

# ===== Passwall =====
git clone https://github.com/xiaorouji/openwrt-passwall.git package/passwall
git clone https://github.com/xiaorouji/openwrt-passwall-packages.git package/passwall-packages

# ===== AdGuardHome / Dockerman =====
git clone https://github.com/kenzok8/small-package.git package/small-package

# ===== Tailscale =====
git clone https://github.com/sbwml/openwrt_helloworld.git package/helloworld

# ===== CloudflareSpeedTest =====
git clone https://github.com/mingxiaoyu/luci-app-cloudflarespeedtest.git package/luci-app-cloudflarespeedtest

# ===== CDN SpeedTest =====
git clone https://github.com/immortalwrt-collections/openwrt-cdnspeedtest.git package/openwrt-cdnspeedtest

# ===== ZeroTier =====
git clone https://github.com/immortalwrt/luci.git package/immortalwrt-luci-temp
mv package/immortalwrt-luci-temp/applications/luci-app-zerotier package/luci-app-zerotier
rm -rf package/immortalwrt-luci-temp

git clone https://github.com/openwrt/packages.git package/openwrt-packages-temp
mv package/openwrt-packages-temp/net/zerotier package/zerotier
rm -rf package/openwrt-packages-temp

# ===== OpenWrt-nikki =====
git clone https://github.com/nikkinikki-org/OpenWrt-nikki.git package/OpenWrt-nikki

