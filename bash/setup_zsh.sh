
#!/bin/bash

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

files=(
	.zshrc .zsh_prompt
)

for file in ${files[@]}; do
	[ -r "$file" ] && [ -f "$file" ] && ln -sfn ${BASEDIR}/"$file" ~/"$file";
done;

chmod -R 755 /usr/local/share/zsh