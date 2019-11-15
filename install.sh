#!/bin/bash

#define path and time
PLUGIN_INSTALL_DIR=$HOME/.vim
CONFIG_INSTALL_DIR=$HOME/.vimrc
SCRIPT_DIR=`pwd`
CURRENT_TIME=`date "+%Y%m%d-%H:%M:%S"`

#Install .vimrc
## back up .vimrc exist
if [ -f "$CONFIG_INSTALL_DIR" ]; then
	mv $CONFIG_INSTALL_DIR $CONFIG_INSTALL_DIR"_bak_"$CURRENT_TIME
	echo "[INFO] Have backuped the $CONFIG_INSTALL_DIR $CONFIG_INSTALL_DIR"_bak_"$CURRENT_TIME"
fi
## install .vimrc to ~
if [ -f "$SCRIPT_DIR/.vimrc" ]; then
    ln -s $SCRIPT_DIR/.vimrc $CONFIG_INSTALL_DIR
    echo "[INFO] Install $SCRIPT_DIR/.vimrc to $CONFIG_INSTALL_DIR"
else
    echo "[ERROR] No $SCRIPT_DIR/.vimrc need be Installed !!"
    exit 1
fi

#Install .vim
## back up .vim exist
if [ -d "$PLUGIN_INSTALL_DIR" ]; then
	mv $PLUGIN_INSTALL_DIR $PLUGIN_INSTALL_DIR"_bak_"$CURRENT_TIME
	echo "[INFO] Have backuped the $PLUGIN_INSTALL_DIR to $PLUGIN_INSTALL_DIR"_bak_"$CURRENT_TIME"
fi
## install .vim to ~
if [ -d "$SCRIPT_DIR/.vim" ]; then
    ln -s $SCRIPT_DIR/.vim $PLUGIN_INSTALL_DIR
    echo "[INFO] Install $SCRIPT_DIR/.vim to $PLUGIN_INSTALL_DIR"
else
    echo "[ERROR] No $SCRIPT_DIR/.vim need be Installed !!"
    exit 2
fi

echo "[INFO] Install finished!"
