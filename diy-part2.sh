#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#
# Modify default theme（FROM uci-theme-bootstrap CHANGE TO luci-theme-material）
sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' ./feeds/luci/collections/luci/Makefile

# Modify default IP
sed -i 's/192.168.1.1/192.168.1.2/g' package/base-files/files/bin/config_generate

# Modify default root's password（FROM 'password'[$1$V4UetPzk$CYXluq4wUazHjmCDBCqXF.] CHANGE TO 'your password'）
# sed -i 's/root::0:0:99999:7:::/root:$1$f1oZaeVG$WDDUVvy1ryUYsfJ/SANBj/:18926:0:99999:7:::/g' /etc/shadow




# sed -i 's/LUCI_DEPENDS.*/LUCI_DEPENDS:=\@\(arm\|\|aarch64\)/g' package/lean/luci-app-cpufreq/Makefile
# Add luci-app-amlogic
# svn co https://github.com/ophub/luci-app-amlogic/trunk/luci-app-amlogic package/luci-app-amlogic
# sed -i 's/PATCHVER:=5.10/PATCHVER:=5.4/g' target/linux/x86/Makefile
