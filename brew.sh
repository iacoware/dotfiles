#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Check for Homebrew,
# Install if we don't have it
if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Install command-line tools using Homebrew.

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Save Homebrew’s installed location.
BREW_PREFIX=$(brew --prefix)

# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
ln -s "${BREW_PREFIX}/bin/gsha256sum" "${BREW_PREFIX}/bin/sha256sum"

# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed

# Install `wget`
brew install wget

brew install tree
brew install z
brew install fzf
brew install bat
brew install fd
brew install httpie
brew install icdiff #remeber to set it up with git
brew install p7zip
brew install ncdu
brew install git
brew install git-lfs
brew install ssh-copy-id
brew install starship
brew install fnm
brew install awscli
brew install direnv
brew install cloc
brew install lastpass-cli
brew install git-delta
brew install broot
brew install zoxide
brew install tokei

####################################################
echo "installing cask apps"

brew tap homebrew/cask-versions

# Development tool casks
brew install --cask iterm2
brew install --cask sublime-text
brew install --cask sublime-merge
brew install --cask visual-studio-code
brew install --cask jetbrains-toolbox
brew install --cask docker
brew install --cask postman
brew install --cask dotnet-sdk
brew install --cask mongodb-compass

# Browsers
brew install --cask google-chrome
brew install --cask firefox
brew install --cask opera
brew install --cask brave-browser
brew install --cask tor-browser

# Miscs
brew install --cask raycast
brew install --cask slack
brew install --cask notion
brew install --cask miro
brew install --cask dropbox
brew install --cask google-drive-file-stream
brew install --cask vlc
brew install --cask fantastical
brew install --cask rectangle
brew install --cask zoom
brew install --cask pop
brew install --cask stretchly

# Install developer friendly quick look plugins; see https://github.com/sindresorhus/quick-look-plugins
brew install --cask qlcolorcode qlstephen qlmarkdown quicklook-json webpquicklook suspicious-package quicklookase

# Not available on M1
#brew install --cask qlvideo
#xattr -d -r com.apple.quarantine ~/Library/QuickLook #Remove quarantine attributes on Catalina and later

######################################################
echo "Install cask fonts"
brew tap homebrew/cask-fonts
brew install --cask font-bebas-neue
brew install --cask font-fira-code
brew install --cask font-jetbrains-mono


brew cleanup