#!/bin/bash

mkdir -p "$HOME/.config"

sourcePath="$(pwd)/starship/config.toml"
dst="$HOME/.config/starship.toml"

echo "${sourcePath} => ${dst}"
ln -sfn "${sourcePath}" "${dst}"
