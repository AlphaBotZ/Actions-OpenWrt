#!/bin/bash
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#
# Copyright (c) 2019-2024 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#

# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default
#sed -i '1i src-git kenzo https://github.com/kenzok8/openwrt-packages' feeds.conf.default
#sed -i '2i src-git small https://github.com/kenzok8/small' feeds.conf.default

# Add a feed source
#echo 'src-git helloworld https://github.com/fw876/helloworld' >>feeds.conf.default
#echo 'src-git passwall https://github.com/xiaorouji/openwrt-passwall' >>feeds.conf.default
echo >> feeds.conf.default
echo 'src-git istore https://github.com/linkease/istore;main' >> feeds.conf.default
./scripts/feeds update istore
./scripts/feeds install -d y -p istore luci-app-store


# 修改x86_64根文件系统大小
set -e  # 出错立即退出，避免误操作

# ===================== 配置参数（可自行调整） =====================
# 定义根文件系统大小：65536k=64M | 131072k=128M | 262144k=256M
IMAGE_SIZE="262144k"
# x86平台镜像配置文件路径（固定）
IMAGE_MAKEFILE="target/linux/x86/image/Makefile"

# ===================== 核心修改逻辑 =====================
echo -e "\n【1/3】开始修改x86_64根文件系统大小为 ${IMAGE_SIZE}..."

# 1. 检查配置文件是否存在
if [ ! -f "${IMAGE_MAKEFILE}" ]; then
    echo -e "⚠️ 错误：未找到 ${IMAGE_MAKEFILE}，请确认LEDE源码路径正确！"
    exit 1
fi

# 2. 备份原文件（避免改坏，后缀.bak）
cp -f "${IMAGE_MAKEFILE}" "${IMAGE_MAKEFILE}.bak"
echo -e "✅ 已备份原文件至 ${IMAGE_MAKEFILE}.bak"

# 3. 适配不同LEDE分支的写法（两种变量名都兼容）
# 替换带k的写法（如 IMAGE_SIZE := 16384k → 65536k）
sed -i "s/IMAGE_SIZE := .*k/IMAGE_SIZE := ${IMAGE_SIZE}/g" "${IMAGE_MAKEFILE}"
# 替换不带k的写法（如 TARGET_IMAGES_SIZE := 16384 → 65536）
sed -i "s/TARGET_IMAGES_SIZE := .*/TARGET_IMAGES_SIZE := ${IMAGE_SIZE%k}/g" "${IMAGE_MAKEFILE}"

# ===================== 验证修改结果 =====================
echo -e "\n【2/3】验证修改结果："
grep -E "IMAGE_SIZE|TARGET_IMAGES_SIZE" "${IMAGE_MAKEFILE}" | grep -v ".bak"

# ===================== 完成提示 =====================
echo -e "\n【3/3】🎉 x86_64根文件系统大小已修改为 ${IMAGE_SIZE}！"
echo -e "       建议执行 make clean 后再编译，确保修改生效"
