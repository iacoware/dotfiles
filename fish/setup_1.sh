#!/bin/bash

# This file must be executed in a bash shell

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

files=(
	config.fish fishfile
)

for file in ${files[@]}; do
	[ -r "$file" ] && [ -f "$file" ] && ln -sfn ${BASEDIR}/"$file" ~/.config/fish/"$file";
done;

for file in ${BASEDIR}/functions/*.fish; do
    echo "link function - $file to ${file##*/}"
    [ -r "$file" ] && [ -f "$file" ] && ln -sfn "$file" ~/.config/fish/functions/"${file##*/}";
done;

#Change the default shell to fish
chsh -s /usr/local/bin/fish

