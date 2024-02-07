# hook brew
if [ "$(arch)" = arm64 ]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
else
    eval "$(/usr/local/bin/brew shellenv)"
fi

## Use gnu tools instead (coreutils)
export PATH=$(brew --prefix coreutils)/libexec/gnubin:$PATH
export MANPATH=$(brew --prefix coreutils)/libexec/gnuman:$MANPATH

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{path,zsh_prompt,exports,aliases,functions,extra}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;
