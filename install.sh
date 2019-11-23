#!/bin/bash

#define path and time
PLUGIN_INSTALL_DIR=$HOME/.vim
CONFIG_INSTALL_DIR=$HOME/.vimrc
IDE_INSTRUCTION_FILE=$HOME/.VimIDEUsage.md
IDE_CSCOPE_DATABASE_CREATE_SCRIPT_FILE=$HOME/cscopemake.sh
SCRIPT_DIR=`pwd`
FILE_BACKUP_NAME_RECORD_FILE=$SCRIPT_DIR/.fileBackupNameRecord
CURRENT_TIME=`date "+%Y%m%d-%H:%M:%S"`

#Clear the backup name record file
if [ -f "$FILE_BACKUP_NAME_RECORD_FILE" ]; then
	echo "[ERROR] The  $FILE_BACKUP_NAME_RECORD_FILE has existed!! You have installed the IDE! Please exec uninstall.sh!"
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

## install cscopemake.sh to ~
## back up cscopemake.sh exist
if [ -f "$IDE_CSCOPE_DATABASE_CREATE_SCRIPT_FILE" ]; then
	mv $IDE_CSCOPE_DATABASE_CREATE_SCRIPT_FILE $IDE_CSCOPE_DATABASE_CREATE_SCRIPT_FILE"_bak_"$CURRENT_TIME
	echo "$IDE_CSCOPE_DATABASE_CREATE_SCRIPT_FILE"_bak_"$CURRENT_TIME" >> $FILE_BACKUP_NAME_RECORD_FILE
	echo "[INFO] Have backuped the $IDE_CSCOPE_DATABASE_CREATE_SCRIPT_FILE $IDE_CSCOPE_DATABASE_CREATE_SCRIPT_FILE"_bak_"$CURRENT_TIME"
fi

if [ -f "$SCRIPT_DIR/cscopemake.sh" ]; then
    ln -s $SCRIPT_DIR/cscopemake.sh $IDE_CSCOPE_DATABASE_CREATE_SCRIPT_FILE
    echo "[INFO] Install $SCRIPT_DIR/.cscopemake.sh to $IDE_CSCOPE_DATABASE_CREATE_SCRIPT_FILE"
else
    echo "[ERROR] No $SCRIPT_DIR/.cscopemake.sh need be Installed !!"
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
    echo "[INFO] Plugin directory .vim exist, now use it."
    ln -s $SCRIPT_DIR/.vim $PLUGIN_INSTALL_DIR
    echo "[INFO] Install $SCRIPT_DIR/.vim to $PLUGIN_INSTALL_DIR"
else
    mkdir -p $SCRIPT_DIR/.vim
    ln -s $SCRIPT_DIR/.vim $PLUGIN_INSTALL_DIR
    read -n 1 -p "[QUERY] No ./.vim pulgin directory exist ! Download plugin now [Y/N]?" ANSWER
    if [ $ANSWER = 'Y' -o  $ANSWER = 'y' ]; then
        echo "[INFO] Install Vundle plugin ...!"
        git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
        echo "[INFO] Install Vundle finished!"
        echo "[INFO] Install the other plugins...!"
        vim +PluginInstall +qall
        echo "[INFO] All plugins have be installed !"
    else
        echo "[INFO] Just created $SCRIPT_DIR/.vim and link it to $PLUGIN_INSTALL_DIR !"
        echo "[INFO] You need download .vim exist to $SCRIPT_DIR/, then the vim IDE can run correctly !"
        exit 1
    fi
fi

#Install some dependence of plugin TODO:different platform support
echo "[INFO] Install Dependence..."
echo "[INFO] Install list:ctags ack-grep xclip cscope"
sudo apt-get install ctags ack-grep xclip cscope

echo "[INFO] Install finished!"
