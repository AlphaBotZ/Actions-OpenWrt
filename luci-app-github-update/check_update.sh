#!/bin/sh
REPO="owner/repo"   # 替换成你的 GitHub 仓库
API="https://api.github.com/repos/$REPO/releases/latest"
CURRENT_VERSION=$(cat /etc/openwrt_version)

LATEST_VERSION=$(curl -s $API | grep tag_name | cut -d '"' -f4)
URL=$(curl -s $API | grep browser_download_url | grep sysupgrade.bin | cut -d '"' -f4)
SHA256=$(curl -s $API | grep sha256 | cut -d '"' -f4)   # 假设你在 release assets 或说明里提供校验值

if [ "$1" = "url" ]; then
    echo "$URL"
    exit 0
fi

if [ "$CURRENT_VERSION" != "$LATEST_VERSION" ]; then
    echo "有新版本: $LATEST_VERSION"
    echo "下载地址: $URL"
    echo "SHA256 校验: $SHA256"
else
    echo "当前已是最新版本 ($CURRENT_VERSION)"
fi
