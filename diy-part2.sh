#!/bin/bash
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# 修改默认IP
sed -i 's/192.168.1.1/192.168.88.2/g' package/base-files/files/bin/config_generate

# luci-theme-argon 主题
git clone https://github.com/jerrykuku/luci-theme-argon package/luci-theme-argon

# 打印服务器及相关USB/文件系统驱动
echo "CONFIG_PACKAGE_luci-app-p910nd=y" >> .config
echo "CONFIG_PACKAGE_p910nd=y" >> .config
echo "CONFIG_PACKAGE_usbutils=y" >> .config
echo "CONFIG_PACKAGE_kmod-usb-printer=y" >> .config
echo "CONFIG_PACKAGE_kmod-usb-core=y" >> .config
echo "CONFIG_PACKAGE_kmod-usb2=y" >> .config
echo "CONFIG_PACKAGE_kmod-usb3=y" >> .config

# 文件系统与存储支持
echo "CONFIG_PACKAGE_kmod-usb-storage=y" >> .config
echo "CONFIG_PACKAGE_kmod-fs-ext4=y" >> .config
echo "CONFIG_PACKAGE_kmod-fs-vfat=y" >> .config
echo "CONFIG_PACKAGE_kmod-fs-ntfs3=y" >> .config
echo "CONFIG_PACKAGE_mountd=y" >> .config
echo "CONFIG_PACKAGE_block-mount=y" >> .config

# Samba 文件共享
echo "CONFIG_PACKAGE_luci-app-samba4=y" >> .config
echo "CONFIG_PACKAGE_samba4-server=y" >> .config

# 常用管理/系统插件
echo "CONFIG_PACKAGE_luci-app-filebrowser=y" >> .config        # 文件管理
echo "CONFIG_PACKAGE_luci-app-autoreboot=y" >> .config        # 定时重启
echo "CONFIG_PACKAGE_luci-app-upnp=y" >> .config              # UPnP
echo "CONFIG_PACKAGE_luci-app-ddns=y" >> .config              # 动态域名解析
echo "CONFIG_PACKAGE_luci-app-netdata=y" >> .config           # 性能监控
echo "CONFIG_PACKAGE_luci-app-wol=y" >> .config               # 网络唤醒
echo "CONFIG_PACKAGE_luci-app-nlbwmon=y" >> .config           # 流量统计
echo "CONFIG_PACKAGE_luci-app-arpbind=y" >> .config           # MAC绑定

# Cloudflare测速 LuCI界面
git clone https://github.com/mingxiaoyu/luci-app-cloudflarespeedtest package/luci-app-cloudflarespeedtest
git clone https://github.com/XIU2/CloudflareSpeedTest package/CloudflareSpeedTest

# 温馨提示：如需更多定制，可继续在此文件添加git clone或CONFIG_PACKAGE_xxx项
