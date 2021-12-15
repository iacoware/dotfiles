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
brew install gnu-sed --with-default-names

# Install `wget` with IRI support.
brew install wget --with-iri

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
brew lastpass-cli

####################################################
echo "installing cask apps"

brew tap homebrew/cask-versions

# Development tool casks
brew cask install iterm2
brew cask install sublime-text
brew cask install sublime-merge
brew cask install visual-studio-code
brew cask install jetbrains-toolbox
brew cask install docker
brew cask install postman
brew cask install dotnet-sdk

# Browsers
brew cask install google-chrome
brew cask install firefox
brew cask install opera
brew cask install brave-browser
brew cask install tor-browser

# Misc casks
brew cask install slack
brew cask install notion
brew cask install miro
brew cask install dropbox
brew cask install google-drive-file-stream
brew cask install vlc
brew cask install fantastical
brew cask install rectangle
brew cask install zoomus
brew cask install pop

# Install developer friendly quick look plugins; see https://github.com/sindresorhus/quick-look-plugins
brew cask install qlcolorcode qlstephen qlmarkdown quicklook-json webpquicklook suspicious-package quicklookase qlvideo
xattr -d -r com.apple.quarantine ~/Library/QuickLook #Remove quarantine attributes on Catalina and later

######################################################
echo "Install cask fonts"
brew tap homebrew/cask-fonts
brew cask install font-bebas-neue

brew cleanup