#!/bin/bash

#define path and time
PLUGIN_INSTALL_DIR=$HOME/.vim
CONFIG_INSTALL_DIR=$HOME/.vimrc
IDE_INSTRUCTION_FILE=$HOME/.VimIDEUsage.md
SCRIPT_DIR=`pwd`
FILE_BACKUP_NAME_RECORD_FILE=$SCRIPT_DIR/.fileBackupNameRecord
CURRENT_TIME=`date "+%Y%m%d-%H:%M:%S"`

#Clear the backup name record file
if [ -f "$FILE_BACKUP_NAME_RECORD_FILE" ]; then
	echo "[ERROR] The  ./.VimIDEUsage.md has existed!! You have installed the IDE! Please exec uninstall.sh!"
    exit -1
fi

echo -n > $FILE_BACKUP_NAME_RECORD_FILE
echo "[INFO] Have cleared the $FILE_BACKUP_NAME_RECORD_FILE for record backup filename."

## install .VimIDEUsage.md to ~
if [ -f "$SCRIPT_DIR/.VimIDEUsage.md" ]; then
    ln -s $SCRIPT_DIR/.VimIDEUsage.md $IDE_INSTRUCTION_FILE
    echo "[INFO] Install $SCRIPT_DIR/.VimIDEUsage.md to $IDE_INSTRUCTION_FILE"
else
    echo "[ERROR] No $SCRIPT_DIR/.VimIDEUsage.md need be Installed !!"
fi

#Install .vimrc
## back up .vimrc exist
if [ -f "$CONFIG_INSTALL_DIR" ]; then
	mv $CONFIG_INSTALL_DIR $CONFIG_INSTALL_DIR"_bak_"$CURRENT_TIME
	echo "$CONFIG_INSTALL_DIR"_bak_"$CURRENT_TIME" >> $FILE_BACKUP_NAME_RECORD_FILE
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
	echo "$PLUGIN_INSTALL_DIR"_bak_"$CURRENT_TIME" >> $FILE_BACKUP_NAME_RECORD_FILE
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
