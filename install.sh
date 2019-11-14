#!/usr/bin/env sh

#define path and time 
PLUGIN_INSTALL_DIR=$HOME/.vim
CONFIG_INSTALL_DIR=$HOME/.vimrc
YCM_CONFIG_INSTALL_DIR=$HOME/.ycm_extra_conf.py
SCRIPT_DIR=`pwd`
CURRENT_TIME=`date "+%m%d-%H:%M"`

#Install .vimrc
if [ -f "$CONFIG_INSTALL_DIR" ]; then
	mv $CONFIG_INSTALL_DIR $CONFIG_INSTALL_DIR"_bak_"$CURRENT_TIME
	echo "[INFO] Have backuped the $CONFIG_INSTALL_DIR $CONFIG_INSTALL_DIR"_bak_"$CURRENT_TIME "
fi
ln -s $SCRIPT_DIR/.vimrc $CONFIG_INSTALL_DIR
echo "[INFO] Install $SCRIPT_DIR/.vimrc to $CONFIG_INSTALL_DIR"

#Install .vim
if [ -d "$PLUGIN_INSTALL_DIR" ]; then
	mv $PLUGIN_INSTALL_DIR $PLUGIN_INSTALL_DIR"_bak_"$CURRENT_TIME
	echo "[INFO] Have backuped the $PLUGIN_INSTALL_DIR to $PLUGIN_INSTALL_DIR"_bak_"$CURRENT_TIME "
fi

if [ -d "$SCRIPT_DIR/.vim" ]; then
    ln -s $SCRIPT_DIR/.vim $PLUGIN_INSTALL_DIR
else
    TODO
fi


echo "[INFO] Install $SCRIPT_DIR/.vim to $PLUGIN_INSTALL_DIR"

#Install .ycm_extra_conf
if [ -f "$YCM_CONFIG_INSTALL_DIR" ]; then
	mv $YCM_CONFIG_INSTALL_DIR $YCM_CONFIG_INSTALL_DIR"_bak_"$CURRENT_TIME
	echo "[INFO] Have backuped the $YCM_CONFIG_INSTALL_DIR to $YCM_CONFIG_INSTALL_DIR"_bak_"$CURRENT_TIME "
fi
ln -s $SCRIPT_DIR/.ycm_extra_conf.py $YCM_CONFIG_INSTALL_DIR
echo "[INFO] Install $SCRIPT_DIR/.ycm_extra_conf.py to $YCM_CONFIG_INSTALL_DIR"

echo "[INFO] Install finished!"
