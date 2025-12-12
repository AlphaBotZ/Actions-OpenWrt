include $(TOPDIR)/rules.mk

PKG_NAME:=github-update
PKG_VERSION:=1.0
PKG_RELEASE:=1

PKG_BUILD_DIR := $(BUILD_DIR)/$(PKG_NAME)

include $(INCLUDE_DIR)/package.mk

define Package/github-update
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=GitHub Firmware Update Checker
  DEPENDS:=+curl +busybox
endef

define Package/github-update/description
  A simple script to check GitHub releases for the latest OpenWrt firmware.
endef

define Build/Compile
endef

define Package/github-update/install
    $(INSTALL_DIR) $(1)/usr/bin
    $(INSTALL_BIN) ./files/usr/bin/check_update.sh $(1)/usr/bin/

    $(INSTALL_DIR) $(1)/etc/crontabs
    $(INSTALL_CONF) ./files/etc/crontabs/root $(1)/etc/crontabs/root
endef

$(eval $(call BuildPackage,github-update))
