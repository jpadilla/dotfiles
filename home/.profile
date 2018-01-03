# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob

# Append to the Bash history file, rather than overwriting it
shopt -s histappend

# Autocorrect typos in path names when using `cd`
shopt -s cdspell

# Prefer US English and use UTF-8
export LC_ALL="en_US.UTF-8"
export LANG="en_US"

# Default editor
export EDITOR='vim'
export VISUAL='vim'

# grep color
export GREP_OPTIONS='--color=auto'

# ls color
export CLICOLOR=1
export LSCOLORS=dxfxcxdxbxegedabagacad

# Local binaries
export PATH="$HOME/.bin:$PATH"

# Homebrew
export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export HOMEBREW_NO_ANALYTICS=1

# Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# Postgres.app
export PATH="/Applications/Postgres.app/Contents/Versions/9.4/bin:$PATH"

# MongoDB.app
export PATH="/Applications/MongoDB.app/Contents/Resources/Vendor/mongodb:$PATH"

# Python startup script
export PYTHONSTARTUP=$HOME/.python-startup.py

# Android SDK
export ANDROID_HOME=/usr/local/opt/android-sdk

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
[[ -r "$NVM_DIR/bash_completion" ]] && . "$NVM_DIR/bash_completion"

# pyenv
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi

# rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# Bash Completion
if hash brew 2>/dev/null && [ -f `brew --prefix`/etc/bash_completion ]; then
  . `brew --prefix`/etc/bash_completion
fi

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2)" scp sftp ssh

# Alias
source "$HOME/.aliases"

# Prompt setup
source "$HOME/.prompt"

# Secrets
[ -s "$HOME/.secret" ] && source "$HOME/.secret"
