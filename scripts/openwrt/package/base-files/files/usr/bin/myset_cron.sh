#!/bin/sh

# 获取当前脚本的完整路径（适配/usr/bin目录）
SCRIPT_PATH="/usr/bin/myset_cron.sh"
myset_script="/mnt/nvme0n1p1/R5S/myset.sh"

# 自动删除计划任务中的自身条目
if crontab -l 2>/dev/null | grep -q -F "$SCRIPT_PATH"; then
    crontab -l 2>/dev/null | grep -v -F "$SCRIPT_PATH" | crontab -
    echo "计划任务已自动清理" >/dev/null 2>&1
fi

# 执行myset.sh脚本
if [ -f "$myset_script" ]; then
    sh "$myset_script" >/dev/null 2>&1
else
    echo "myset.sh脚本未找到，跳过执行" >/dev/null 2>&1
fi





# 可选：如果需要执行后删除脚本本身，取消下面一行的注释
# rm -f "$SCRIPT_PATH"

