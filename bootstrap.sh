#!/bin/bash

# Colors
function echoY() {
    prompt="$1"
    echo -e -n "\033[32m$prompt"
    echo -e -n '\033[0m'
    echo ''
}
function echoR() {
    prompt="$1"
    echo -e -n "\033[31m$prompt"
    echo -e -n '\033[0m'
    echo ''
}
function echoB() {
    prompt="$1"
    echo -e -n "\033[34m$prompt"
    echo -e -n '\033[0m'
    echo ''
}

# Get file list
function getFilesInDir() {
    find . -type f -name '.*' -exec basename {} ';'
}

# Set vars
FILES=$(getFilesInDir)
CURRENTPATH=$(pwd)
FORCE=false

# Change value of FORCE
if [ "$1" == "--force" ]; then
    FORCE=true
fi

function createSymlinks() {
    for F in ${FILES[@]}; do
        # Delete files if --force was used
        if [ $FORCE == true ]; then
            echoR "--> [DELETE]: $HOME/${F}"
            rm $HOME/$F
        fi

        # Make symlink
        echoY "--> [LINK]: ${HOME}/${F} -> ${CURRENTPATH}/${F}"
        ln -s $CURRENTPATH/$F $HOME/$F

        if [ $? -eq 1 ]; then
            echo
            echoR "--> [ERROR]: You have already have a file named ${F} in your home folder."
            echoR "    Please backup of your old files."
            echoR "    Using \"--force\" will allow you to overwrite your existing files."
            echo
            break
        fi
    done
}

# Run
createSymlinks

echo
echoB "--> [DONE]"
echo

unset echoY
unset echoR
unset echoB
unset getFilesInDir
unset createSymlinks

source ~/.bash_profile
