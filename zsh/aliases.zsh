alias reload!='. ~/.zshrc'

# Easier navigation
alias ..="cd .."
alias ...="cd ../.."
alias h='cd ~/'

# Enable aliases to be sudo’ed
alias sudo='sudo '

# Shortcuts
alias dl="cd ~/Downloads"
alias d="cd ~/Desktop"
alias p="cd ~/Projects"
alias dotfiles="cd ~/.dotfiles"
alias o='open .'
alias ls='ls -lah'

# Network
alias dig="dig @8.8.8.8 ANY +noall +answer $1"
alias digns="dig @8.8.8.8 +short NS $1"
alias whois="whois -h whois-servers.net"
alias sniff="sudo ngrep -d 'en1' -t '^(GET|POST) ' 'tcp and port 80'"
alias scan="nmap -T4 --max-rtt-timeout=500ms --initial-rtt-timeout=200ms --min-rtt-timeout=200ms --open --stats-every 5s $1"
alias sscan="sudo nmap -sS -T4 --max-rtt-timeout=500ms --initial-rtt-timeout=200ms --min-rtt-timeout=200ms --open --stats-every 5s $1"
alias ipinfo="open https://ipinfo.io/$1"

# Flush Directory Service cache
alias flush="dscacheutil -flushcache && sudo killall -HUP mDNSResponder"

# Clean up LaunchServices to remove duplicates in the "Open With" menu
alias lscleanup="/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user && killall Finder"

# Git
alias gpush='git push origin $(git rev-parse --abbrev-ref HEAD)'
alias gpull='git pull --rebase origin $(git rev-parse --abbrev-ref HEAD)'
alias gtag='git tag -s $1'

# Empty the Trash on all mounted volumes and the main HDD
# Also, clear Apple’s System Logs to improve shell startup speed
alias emptytrash="sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv ~/.Trash; sudo rm -rfv /private/var/log/asl/*.asl"

# Show/hide hidden files in Finder
alias show="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
alias hide="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"

# Lock the screen (when going AFK)
alias afk="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"

# VS Code extension management
alias vscode-extensions-save='code --list-extensions > ~/Projects/personal/dotfiles/vscode/extensions.txt && echo Done!'
alias vscode-extensions-install='xargs -n 1 code --install-extension < ~/Projects/personal/dotfiles/vscode/extensions.txt'

# Other
alias server='python -m SimpleHTTPServer 8888'
alias npmls='npm list --depth=0 "$@" 2>/dev/null'
alias pycclean='find . -name \*.pyc -delete'
alias sshf='ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no'

# Functions
function ip() {
  IP=$(ipconfig getifaddr en0)
  IFACE="en0"

  if [[ -z "$IP" ]]; then
    IP=$(ipconfig getifaddr en4)
    IFACE="en4"
  fi

  echo "Local($IFACE): $IP"
  echo "Remote:     $(curl -s https://ipinfo.io/ip)"
}

function gi() {
  curl https://www.gitignore.io/api/$@;
}

function archive() {
  tar cvJf "$1.tar.xz" "$1"
}

function unarchive() {
  tar xvJf "$1"
}

# Local aliases
[ -s "$HOME/.aliases.local" ] && source "$HOME/.aliases.local"
