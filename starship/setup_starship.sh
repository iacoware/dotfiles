
#!/bin/bash

mkdir -p ~/.config

# Doesn't work 'too many symbolic links'
# ln -sfn starship.toml ~/.config/starship.toml
cp starship.toml ~/.config/
