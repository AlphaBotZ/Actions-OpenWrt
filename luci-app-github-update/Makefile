include $(TOPDIR)/rules.mk

LUCI_TITLE:=LuCI GitHub Firmware Update Checker
LUCI_DEPENDS:=+curl +busybox
LUCI_PKGARCH:=all

include $(TOPDIR)/feeds/luci/luci.mk

$(eval $(call BuildPackage,luci-app-github-update))
