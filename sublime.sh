#!/bin/bash

pkg_url="https://sublime.wbond.net/Package%20Control.sublime-package"
pkgs_path="$HOME/Library/Application Support/Sublime Text 3/Installed Packages"
pkg_opts="$HOME/Library/Application Support/Sublime Text 3/Packages/User"

# Download @wbond Package Control plugin
curl -o "$pkgs_path/Package Control.sublime-package" $pkg_url

# Copy Package Control installed packages
cp "support/Package Control.sublime-settings" "$pkg_opts/"

# Copy user settings
cp support/Preferences.sublime-settings "$pkg_opts/"
