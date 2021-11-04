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
sed -i 's/root:$1$V4UetPzk$CYXluq4wUazHjmCDBCqXF.:0:0:99999:7:::/root:$1$f1oZaeVG$WDDUVvy1ryUYsfJ/SANBj/:18926:0:99999:7:::/g' package/lean/default-settings/files/zzz-default-settings

# 密码为空
# sed -i 's@.*CYXluq4wUazHjmCDBCqXF*@#&@g' package/lean/default-settings/files/zzz-default-settings
# 增加名字zhj213
# sed -i "s/OpenWrt /zhj213 compiled in $(TZ=UTC-8 date "+%Y.%m.%d") @ OpenWrt /g" package/lean/default-settings/files/zzz-default-settings




# Add app
svn co https://github.com/esirplayground/luci-app-poweroff package/luci-app-poweroff
# 全新的[argon-主题]此主题玩法很多,这里看说明【https://github.com/jerrykuku/luci-theme-argon/blob/18.06/README_ZH.md】
# 用WinSCP连接openwrt，在/www/luci-static/argon里面创建background文件夹（如果本身就有background就不需要创建）来存放jpg png gif格式图片可以自定义登陆界面，gif图片为动态登陆界面
rm -rf ./package/lean/luci-theme-argon && git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git package/lean/luci-theme-argon
# svn co https://github.com/sirpdboy/NetSpeedTest package/NetSpeedTest
# git clone https://github.com/destan19/OpenAppFilter package/lean/luci-app-oaf



# sed -i 's/LUCI_DEPENDS.*/LUCI_DEPENDS:=\@\(arm\|\|aarch64\)/g' package/lean/luci-app-cpufreq/Makefile
# Add luci-app-amlogic
# svn co https://github.com/ophub/luci-app-amlogic/trunk/luci-app-amlogic package/luci-app-amlogic
# sed -i 's/PATCHVER:=5.10/PATCHVER:=5.4/g' target/linux/x86/Makefile
