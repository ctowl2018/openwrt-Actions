# 关闭RFC1918
#sed -i 's/option rebind_protection 1/option rebind_protection 0/g' package/network/services/dnsmasq/files/dhcp.conf
#sed -i 's/8000/0/g' package/network/services/dnsmasq/files/dhcp.conf

# 修改插件位置
#sed -i 's/vpn/services/g' feeds/luci/applications/luci-app-zerotier/root/usr/share/luci/menu.d/luci-app-zerotier.json
#sed -i 's/nas/services/g' feeds/luci/applications/luci-app-aria2/root/usr/share/luci/menu.d/luci-app-aria2.json
#sed -i 's/nas/services/g' feeds/luci/applications/luci-app-samba4/root/usr/share/luci/menu.d/luci-app-samba4.json

# 加载默认设置
# cp -a $GITHUB_WORKSPACE/scripts/openwrt/* ./

#./scripts/feeds update -a
#./scripts/feeds install -a
