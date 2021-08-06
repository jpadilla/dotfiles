#!/bin/bash

function symlinkFilesTo() {
  echo "$1" | while read -r sourcePath; do
    cleanPath=$(dirname $(echo "$sourcePath" | cut -d/ -f6-))
    filePath=$(basename "${sourcePath%.*}")
    if [ "$cleanPath" == "." ]; then
      dst="$2/$filePath"
    else
      dst="$2/$cleanPath/$filePath"
    fi
    echo "${sourcePath} => ${dst}"
    ln -sfn "${sourcePath}" "${dst}"
  done
}

# Home files
echo "--> home symlinks.."
homeFiles=$(find -H $(pwd) -maxdepth 2 -name '*.symlink' -not -path '*vscode*')
symlinkFilesTo "$homeFiles" "$HOME"

# vscode
echo "--> VSCode symlinks..."
mkdir -p "$HOME/Library/Application Support/Code/User/snippets"
vscodeFiles=$(find -H "$(pwd)/vscode" -maxdepth 2 -name '*.symlink')
symlinkFilesTo "$vscodeFiles" "$HOME/Library/Application Support/Code/User"

# Done
echo "--> Done!"
unset symlinkFilesTo
