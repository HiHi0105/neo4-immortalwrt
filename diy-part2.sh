#!/bin/bash

# 默认IP
sed -i 's/192.168.1.1/192.168.9.2/g' package/base-files/files/bin/config_generate

# 默认中文
sed -i "s/UTC/CST-8/g" package/base-files/files/bin/config_generate

# 关闭DHCP
cat >> package/base-files/files/etc/uci-defaults/99-disable-dhcp << 'EOF'
#!/bin/sh
uci set dhcp.lan.ignore='1'
uci commit dhcp
EOF

# 关闭WiFi
cat >> package/base-files/files/etc/uci-defaults/99-disable-wifi << 'EOF'
#!/bin/sh
uci set wireless.@wifi-device[0].disabled='1'
uci commit wireless
EOF

chmod +x package/base-files/files/etc/uci-defaults/99-disable-dhcp
chmod +x package/base-files/files/etc/uci-defaults/99-disable-wifi
