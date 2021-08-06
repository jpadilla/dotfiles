if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
