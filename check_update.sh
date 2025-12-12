#!/bin/sh
REPO="owner/repo"   # 替换成你的 GitHub 仓库
API="https://api.github.com/repos/$REPO/releases/latest"
CURRENT_VERSION=$(cat /etc/openwrt_version)

LATEST_VERSION=$(curl -s $API | grep tag_name | cut -d '"' -f4)

if [ "$CURRENT_VERSION" != "$LATEST_VERSION" ]; then
    echo "有新版本: $LATEST_VERSION"
    # 可选：自动下载固件
    # URL=$(curl -s $API | grep browser_download_url | grep sysupgrade.bin | cut -d '"' -f4)
    # wget -O /tmp/latest.bin $URL
    # sysupgrade /tmp/latest.bin
else
    echo "当前已是最新版本"
fi
