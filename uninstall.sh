#!/bin/bash

#define path
PLUGIN_INSTALL_DIR=$HOME/.vim
CONFIG_INSTALL_DIR=$HOME/.vimrc

# Interaction for sure to detele files
read -n 1 -p "Are you sure to delete the ~/.vim and the ~/.vimrc [Y/N]?" ANSWER
echo ""
if [ $ANSWER = 'Y' -o  $ANSWER = 'y' ]; then
   #delete .vim
    if [ -d "$PLUGIN_INSTALL_DIR" ]; then
        rm -r $PLUGIN_INSTALL_DIR
        echo "[INFO] Have deleted the $PLUGIN_INSTALL_DIR"
    else
        echo "[WARNING] Have no $PLUGIN_INSTALL_DIR"
    fi

    #delete .vimrc
    if [ -f "$CONFIG_INSTALL_DIR" ]; then
        rm $CONFIG_INSTALL_DIR
        echo "[INFO] Have deleted the $CONFIG_INSTALL_DIR"
    else
        echo "[WARNING] Have no $CONFIG_INSTALL_DIR"
    fi

    echo "Uninstall finished!"
else
    echo "Do nothing!"
    exit 1
fi
