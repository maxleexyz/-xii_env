#!/bin/bash

function generateKey() {
  local fileType=$1
  local fileName=$2
  # 生成ssh key 如果没有就自动来一个!
  echo "📣 $fileType ssh key check..."

  if [[ ! -f ~/.ssh/$fileName.pub ]]; then
    echo "⚙️ key generation starts."
    ssh-keygen -t rsa -f ~/.ssh/$fileName
    echo "⚙️ Generate backup"
    cp ~/.ssh/$fileName.pub ~/.ssh/$fileName.pub.bak
    cp ~/.ssh/$fileName ~/.ssh/$fileName.bak

  else
    echo "✅ ~/.ssh/$fileName"
  fi
}

generateKey gitee gitee_id_rsa
generateKey github github_id_rsa

echo "验证下是否有ssh config,如果没有会帮你生成一个..."
if [[ ! -f ~/.ssh/config ]]; then
  echo "# gitee
Host gitee.com
HostName gitee.com
PreferredAuthentications publickey
IdentityFile ~/.ssh/gitee_id_rsa
# github
Host github.com
HostName github.com
PreferredAuthentications publickey
IdentityFile ~/.ssh/github_id_rsa" >~/.ssh/config

else
  echo "✅ ~/.ssh/config"
fi
