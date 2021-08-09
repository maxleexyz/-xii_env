#!/bin/bash

# 安装iterm2

source ./xii_function.sh

# declare -A apps=(["iterm2"]="/Applications/iTerm.app" 
# ["sublime-text"]="/Applications/Sublime\ Text.app" 
# ["sourcetree"]="/Applications/Sourcetree.app" 
# )

declare -A map=(["100"]="1" ["200"]="2")


for key in ${!map[@]}
do
    echo ${map[$key]}
done

# for key in ${!apps[@]}; do
# 	echo "key:"$key
# 	echo "value:"${apps[$key]}
# done

# cli_array=(wget tree youtube-dl speedtest)

# for cliName in $cli_array; do
# 	installCli $cliName
# done
