#!/bin/bash

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

files=(
	init.lua win-mgr.lua
)

for file in ${files[@]}; do
	[ -r "$file" ] && [ -f "$file" ] && ln -sfn ${BASEDIR}/"$file" ~/.hammerspoon/"$file";
done;

ln -sfn ${BASEDIR}/Spoons ~/.hammerspoon/