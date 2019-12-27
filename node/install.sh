#!/bin/bash

set -euf -o pipefail

echo "=> Installing nvm and node..."
curl https://raw.githubusercontent.com/creationix/nvm/master/install.sh | \
  NODE_VERSION='lts/*' PROFILE='/dev/null' bash

. $DOTFILES/node/setup-nvm.zsh
