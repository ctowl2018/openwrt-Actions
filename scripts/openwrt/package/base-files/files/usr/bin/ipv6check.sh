#!/bin/sh
INTERFACE="eth2"
TAG="IPv6_Check"

# 检查接口是否存在
if ! ip -6 addr show $INTERFACE >/dev/null 2>&1; then
    logger -t $TAG "$INTERFACE not found"
    exit 1
fi

# 获取 IPv6 地址数量（排除 fe80::）
IPV6_COUNT=$(ip -6 addr show dev $INTERFACE | grep -v 'fe80::' | grep -c 'inet6 ')

# 输出到终端（可用于调试）
echo "[$(date)] [$TAG] $INTERFACE IPv6 count is $IPV6_COUNT"

# 若 IPv6 数量 ≤1 或 ≥3，则重启接口
if [ "$IPV6_COUNT" -le 1 ] || [ "$IPV6_COUNT" -ge 3 ]; then
    logger -t $TAG "$INTERFACE IPv6 count is $IPV6_COUNT (≤1 or ≥3), restarting wan6..."
    ifdown wan6
    sleep 2
    ifup wan6
    sleep 5
fi
