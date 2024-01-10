if which pyenv > /dev/null; then
  export PATH="$HOME/.pyenv/shims:${PATH}"
  eval "$(pyenv init -)";
  alias brew='env PATH="${PATH//$(pyenv root)\/shims:/}" brew'
fi
