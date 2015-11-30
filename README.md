# dotfiles

This is a collection of my dotfiles for Mac OS X. Borrows some things from [mathiasbynens/dotfiles](https://github.com/mathiasbynens/dotfiles) and [gcollazo/dotfiles](https://github.com/gcollazo/dotfiles).

## Install

### Install OS updates

Make sure your machine has all OS updates installed.

```bash
sudo softwareupdate --install --all
```

### Xcode
Install the latest [Xcode](https://itunes.apple.com/us/app/xcode/id497799835?mt=12) from the AppStore and launch it.

### Clone, install and symlink
Clone this repo and run the install script. This script will also run `symlinks.sh`.

```bash
git clone git@github.com:jpadilla/dotfiles.git
cd dotfiles
./install.sh
```

### Atom Packages
Launch Atom and **Install Shell Commands**. Once the Atom shell commands are installed you can install packages. All the packages that I use are starred and can be found on my [user profile](https://atom.io/users/jpadilla/stars).

To install packages:

```bash
apm login
apm stars --install
```

To update packages:

```bash
apm star --installed
```

## My OS X Setup

### Manual Installation

This are apps that can't be installed with or I prefer not to install with Cask.

- [Xcode](https://itunes.apple.com/us/app/xcode/id497799835?mt=12)
- [1Password](https://itunes.apple.com/us/app/1password-password-manager/id443987910?mt=12)
- [Navicat Premium Essentials](https://itunes.apple.com/us/app/navicat-premium-essentials/id466416967?mt=12)
- [TweetDeck](https://itunes.apple.com/us/app/tweetdeck-by-twitter/id485812721?mt=12)
- [Pages](https://itunes.apple.com/us/app/pages/id409201541?mt=12)
- [Keynote](https://itunes.apple.com/us/app/keynote/id409183694?mt=12)
- [Numbers](https://itunes.apple.com/us/app/numbers/id409203825?mt=12)
- [Evernote](https://itunes.apple.com/us/app/evernote/id406056744?mt=12)
- [Slack](https://itunes.apple.com/us/app/slack/id803453959?mt=12)

#### Browsers

- [Chrome](https://www.google.com/chrome/browser/)
- [Firefox](https://www.mozilla.org/en-US/firefox/new/)
- [Tor](https://www.torproject.org/download/download-easy.html.en)
