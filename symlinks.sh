#!/bin/bash

# Gets a list of files
function getFilesInDir() {
  find "$1" ! -path ./.DS_Store -name '*.*'
}

# $1 directory to search for files
# $2 destination of symlink
function symlinkFilesTo() {
  for F in $(getFilesInDir "$1"); do
    # Make symlink
    cleanPath=$(echo "$F" | sed 's,^[^/]*/,,')
    echo "- ${2}/${cleanPath} -> ${1}/${cleanPath}"
    ln -sfn "${PWD}/${1}/${cleanPath}" "${2}/${cleanPath}"
  done
}

# Home files
echo "--> home symlinks.."
symlinkFilesTo home "${HOME}"

# vscode
echo "--> VSCode symlinks..."
mkdir -p "${HOME}/Library/Application Support/Code/User/snippets"
symlinkFilesTo vscode "${HOME}/Library/Application Support/Code/User"

# Done
echo "--> Done!"

# Unset
unset getFilesInDir
unset symlinkFilesTo

source ~/.bash_profile
