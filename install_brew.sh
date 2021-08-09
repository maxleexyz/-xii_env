#!/bin/bash

# 装brew同时会自动安装xcode command line tools 详见其官网: https://brew.sh/index_zh-cn 

echo "-----------------------------------------------"
echo "安装brew同时会自动安装xcode command line tools:"
if  [ ! command -v brew >/dev/null 2>&1 ] 
then
  echo "没安装,来自动装一个.homebrew!"
  # 官网推荐的brew安装方式:
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  # export SHELL="/bin/zsh"

  # # TODO: 如果安装失败,那么退出脚本!
  echo "安装brew的一些常用库"
  brew tap homebrew/cask
  brew tap homebrew/cask-versions

else
  echo "你已经安装好brew,自动跳过这个步骤!"
fi

# 启用xcode的命令行开发工具
#sudo xcode-select -switch /Applications/Xcode.app/Contents/Developer



echo "-----------------------------------------------"

installCli git

