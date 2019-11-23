#!/bin/bash

#define path
PLUGIN_INSTALL_DIR=$HOME/.vim
CONFIG_INSTALL_DIR=$HOME/.vimrc
IDE_INSTRUCTION_FILE=$HOME/.VimIDEUsage.md
IDE_CSCOPE_DATABASE_CREATE_SCRIPT_FILE=$HOME/cscopemake.sh
SCRIPT_DIR=`pwd`
FILE_BACKUP_NAME_RECORD_FILE=$SCRIPT_DIR/.fileBackupNameRecord
COFIG_FILE_LINES=0

# Interaction for sure to detele files
if [ -f "$FILE_BACKUP_NAME_RECORD_FILE" ]; then
    read -n 1 -p "[QUERY] You have installed your vim IDE. Are you sure to delete the ~/.vim and the ~/.vimrc [Y/N]?" ANSWER
else
    read -n 1 -p "[QUERY] You have !!!no!!! installed your vim IDE. Are you sure to delete the ~/.vim and the ~/.vimrc [Y/N]?" ANSWER
fi
echo ""

# delete .vim and .vimrc recover all backupfiles
if [ $ANSWER = 'Y' -o  $ANSWER = 'y' ]; then
    #delete cscopemake.sh
    if [ -f "$IDE_CSCOPE_DATABASE_CREATE_SCRIPT_FILE" ]; then
        rm $IDE_CSCOPE_DATABASE_CREATE_SCRIPT_FILE
        echo "[INFO] Have deleted the $IDE_CSCOPE_DATABASE_CREATE_SCRIPT_FILE"
    else
        echo "[WARNING] Have no $IDE_CSCOPE_DATABASE_CREATE_SCRIPT_FILE"
    fi

    #delete .VimIDEUsage.md
    if [ -f "$IDE_INSTRUCTION_FILE" ]; then
        rm $IDE_INSTRUCTION_FILE
        echo "[INFO] Have deleted the $IDE_INSTRUCTION_FILE"
    else
        echo "[WARNING] Have no $IDE_INSTRUCTION_FILE"
    fi

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

    # recover files backuped by install.sh
    while read line
    do
        COFIG_FILE_LINES=$(( $COFIG_FILE_LINES + 1 ))
        if [[ "${line}" == *vimrc* ]]; then
            mv ${line} $CONFIG_INSTALL_DIR
            echo "[INFO] mv ${line} $CONFIG_INSTALL_DIR"
        elif [[ "${line}" == *vim* ]]; then
            mv ${line} $PLUGIN_INSTALL_DIR
            echo "[INFO] mv ${line} $PLUGIN_INSTALL_DIR"
        elif [[ "${line}" == *cscopemake* ]]; then
            mv ${line} $IDE_CSCOPE_DATABASE_CREATE_SCRIPT_FILE
            echo "[INFO] mv ${line} $IDE_CSCOPE_DATABASE_CREATE_SCRIPT_FILE"
        else
            echo "[WARNING] This line have no .vim or .vimrc or cscopemake.sh back up name."
        fi
    done < $FILE_BACKUP_NAME_RECORD_FILE

    if [ $COFIG_FILE_LINES -eq 0 ]; then
        echo "[WARNING] name record config file is empty."
    fi
    ## delete record file
    rm $FILE_BACKUP_NAME_RECORD_FILE
    echo "[INFO] rm $FILE_BACKUP_NAME_RECORD_FILE"

    echo "[INFO] Uninstall finished!"
else
    echo "[INFO] Do nothing!"
    exit 1
fi
