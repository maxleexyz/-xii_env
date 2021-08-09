#!/bin/bash

function installApp() {

	echo "📣 check $2 "
	if [ -e "$1" ]; then
		echo "✅ $1 installed"
	else
		read -p "⚠️ install :$2 [y/n](enter y)" IS_INSTALL
		if [ "$IS_INSTALL" == "y" ] || [ "$IS_INSTALL" == "" ]; then
			echo "==> Installing $2"
			brew install --cask $2
		fi
	fi
	echo "-----------------------------------------------"
}

function installCli() {
	local install_name=$1
	local check_cmd=$2

	echo "📣 check $name "
	local ret='0'
	command -v $check_cmd >/dev/null 2>&1 || { local ret='1'; }
	if [ "$ret" -ne 0 ]; then
		read -p "⚠️ install :$install_name [y/n](enter y)" IS_INSTALL
		if [ "$IS_INSTALL" == "y" ] || [ "$IS_INSTALL" == "" ]; then
			echo "==> Installing $install_name"
			brew install $install_name
		fi

	else
		echo "✅ $install_name installed"
	fi
	echo "-----------------------------------------------"
}

function uninstallApp() {
	if [ -e "$1" ]; then
		echo "开始删除 $1 应用程序"
		brew uninstall $1
	else
		echo "$1 已删除."
	fi
	echo "-----------------------------------------------"
}

function uninstallCli() {
	local ret='0'
	command -v $1 >/dev/null 2>&1 || { local ret='1'; }
	if [ "$ret" -ne 0 ]; then
		echo "开始删除 $1 命令行工具"
		brew uninstall $1
	else
		echo "$1 已删除."
	fi
	echo "-----------------------------------------------"
}
