#!/usr/bin/env sh

#define path 
PLUGIN_INSTALL_DIR=$HOME/.vim
CONFIG_INSTALL_DIR=$HOME/.vimrc
YCM_CONFIG_INSTALL_DIR=$HOME/.ycm_extra_conf.py

#delete .vim
if [ -d "$PLUGIN_INSTALL_DIR" ]; then
    rm -r $PLUGIN_INSTALL_DIR  
	echo "[INFO] Have deleted the $PLUGIN_INSTALL_DIR"
fi

#delete .vimrc
if [ -f "$CONFIG_INSTALL_DIR" ]; then
    rm $CONFIG_INSTALL_DIR  
	echo "[INFO] Have deleted the $CONFIG_INSTALL_DIR"
fi

#delete .ycm_extra_conf
if [ -f "$YCM_CONFIG_INSTALL_DIR" ]; then
    rm  $YCM_CONFIG_INSTALL_DIR  
	echo "[INFO] Have deleted the $YCM_CONFIG_INSTALL_DIR"
fi

echo "Uninstall finished!"
