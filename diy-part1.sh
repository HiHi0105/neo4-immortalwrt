#!/bin/bash

# Passwall
git clone https://github.com/xiaorouji/openwrt-passwall package/passwall
git clone https://github.com/xiaorouji/openwrt-passwall-packages package/passwall-packages

# Lucky
git clone https://github.com/sirpdboy/luci-app-lucky package/lucky

# ImmortalWrt feeds
sed -i 's|https://git.openwrt.org/feed/|https://github.com/immortalwrt/packages.git|g' feeds.conf.default
