#!/bin/bash

# 设置计时器，72小时
timeout 72h bash -c "
    # 在当前目录运行 ./bin/syz-manager 命令
    ./bin/syz-manager -config=my.cfg > ./workDir/tmpLog
"

# 计时器到时，kill 掉 syz-manager 进程
if [ $? -eq 143 ]; then
    killall ./bin/syz-manager
fi