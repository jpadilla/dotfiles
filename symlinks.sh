#!/bin/bash

# Colors
function yellow() {
    prompt="$1"
    echo -e -n "\033[32m$prompt"
    echo -e -n '\033[0m'
    echo ''
}

function red() {
    prompt="$1"
    echo -e -n "\033[31m$prompt"
    echo -e -n '\033[0m'
    echo ''
}

function blue() {
    prompt="$1"
    echo -e -n "\033[34m$prompt"
    echo -e -n '\033[0m'
    echo ''
}

# Gets a list of files
function getFilesInDir() {
  find $1 ! -path ./.DS_Store -name '*.*'
}

# $1 directory to search for files
# $2 destination of symlink
function symlinkFilesTo() {
  for F in $(getFilesInDir $1); do
    # Make symlink
    cleanPath=$(echo "$F" | sed 's,^[^/]*/,,')
    yellow "- ${2}/${cleanPath} -> ${1}/${cleanPath}"
    ln -sfn "${PWD}/${1}/${cleanPath}" "${2}/${cleanPath}"
  done
}

# Home files
blue "--> home symlinks.."
symlinkFilesTo home "${HOME}"

# vscode
blue "--> VSCode symlinks..."
mkdir -p "${HOME}/Library/Application Support/Code/User/snippets"
symlinkFilesTo vscode "${HOME}/Library/Application Support/Code/User"

# Done
blue "--> Done!"

# Unset and source
unset yellow
unset red
unset blue
unset getFilesInDir
unset symlinkFilesTo

source ~/.bash_profile
