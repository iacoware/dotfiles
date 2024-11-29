# dotfiles

A collection of dotfiles that suits my needs. Stolen from:

-   https://github.com/mathiasbynens/dotfiles
-   https://github.com/donnemartin/dev-setup
-   https://github.com/matthewmueller/dots

## Steps

1. `xcode-select --install`
2. `git clone https://github.com/iacoware/dotfiles.git`
3. `install brew`, see https://brew.sh
4. `./brew.sh`
5. `./macos.sh`
6. setup shell

    1. install `oh-my-zsh` with `sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"`
    2. `./zsh/setup_zsh.sh`

7. `./git/setup.sh`

## Brew

-   To update the dependencies installed (only binaries and fonts, not casks) run `brew bundle`
