Other things to install/rember that I've not (yet) automated:

-   Paragon NTFS driver to write on NTFS volumes
-   Install the CLI that enable logging hours within Toggl (Python app)

-   install ohmyzsh
    -   `sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"`
    - disable directories aliases (rename lib/directories.zsh to lib/directories.not_zsh to avoid loading)
    - New way to skip omz aliases (2023). See https://github.com/ohmyzsh/ohmyzsh#skip-aliases
        ````
        # Skip only aliases defined in the directories.zsh lib file
        zstyle ':omz:lib:directories' aliases no

        # Skip only the aliases from the git plugin
        zstyle ':omz:plugins:git' aliases no

        # Skip only the aliases from the yarn plugin
        zstyle ':omz:plugins:yarn' aliases no
        ````


- iterm tweaks
    - theme (New Moon)
    - On profile -> key mapping select "Natural Text Editing" preset (word-by-word movement)
    - Open New Tab with Same Directory
        - https://www.freecodecamp.org/news/jump-between-words-using-keyboard-shortcuts-in-iterm-fb1a70cecf79/
    - Select text using shift + arrows
        - Not possibile CMD+SHIFT+C enter copy mode -> SPACE BAR start copy + move as usual

### macOS teaks    
- System Preferences
    - Mission control
        - Display have seaprate spaces: disabled 
        - When switching to an app... : disabled


### Webstorm

#### Keymaps
- Clone caret below
- Refactor this

#### Templates
- vitest, jest import
- tt
- Effect imports



### Shortcuts

CMD+SHIFT+. Show/Hide hidden files in Finder
