set pure_symbol_prompt "~>"

#Add more directory to PATH
set -U fish_user_paths $fish_user_paths /usr/local/opt/coreutils/libexec/gnubin
set -U fish_user_paths $fish_user_paths ./node_modules/.bin

abbr --add p cd ~/projects
abbr --add k cd ~/projects/katas
abbr --add less less -FRX

nvm use default