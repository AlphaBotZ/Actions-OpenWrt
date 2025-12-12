#!/bin/sh
REPO="owner/repo"   # 替换成你的 GitHub 仓库，例如 "Teng/Actions-OpenWrt"
API="https://api.github.com/repos/$REPO/releases/latest"
CURRENT_VERSION=$(cat /etc/openwrt_version)

# 获取最新版本号、下载地址、SHA256 校验值
LATEST_VERSION=$(curl -s $API | grep tag_name | cut -d '"' -f4)
URL=$(curl -s $API | grep browser_download_url | grep sysupgrade.bin | cut -d '"' -f4)
SHA256=$(curl -s $API | grep sha256 | cut -d '"' -f4)   # 需要你在 Release 中提供

# 参数模式
case "$1" in
    latest)
        echo "$LATEST_VERSION"
        ;;
    url)
        echo "$URL"
        ;;
    sha256)
        echo "$SHA256"
        ;;
    *)
        if [ "$CURRENT_VERSION" != "$LATEST_VERSION" ]; then
            echo "有新版本 / New Version: $LATEST_VERSION"
            echo "下载地址 / Download URL: $URL"
            echo "SHA256 校验 / SHA256: $SHA256"
        else
            echo "当前已是最新版本 ($CURRENT_VERSION) / Already up-to-date"
        fi
        ;;
esac
