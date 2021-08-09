#!/bin/bash

function installApp() {

	echo "📣 $2 check exist"
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
	echo "📣 $1 check exist"
	local ret='0'
	command -v $1 >/dev/null 2>&1 || { local ret='1'; }
	if [ "$ret" -ne 0 ]; then
		read -p "⚠️ install :$2 [y/n](enter y)" IS_INSTALL
		if [ "$IS_INSTALL" == "y" ] || [ "$IS_INSTALL" == "" ]; then
			echo "==> Installing $1"
			brew install $1
		fi

	else
		echo "✅ $1 installed"
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
