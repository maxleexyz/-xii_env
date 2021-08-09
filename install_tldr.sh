#!/bin/bash

echo "-----------------------------------------------"
#brew install tldr + alias help
read -p "即将安装:tldr [y/n](默认为y)" IS_INSTALL
if [ "$IS_INSTALL" == "y" ] || [ "$IS_INSTALL" == "" ]; then
  echo "开始安装 tldr"
  brew install tldr
  if ! grep "alias help=\"tldr\"" ~/.zshrc; then
    # 给配置里加一个别名,以后只需要执行 help xxx就能看到这个命令是怎么用的了.
    echo "alias help=\"tldr\"" >>~/.zshrc
  fi
fi

echo "所有软件安装完成，建议你重新打开一个终端窗口，以加载全部辅助功能！(iTerm2装好了!那就快去使用吧.)"
