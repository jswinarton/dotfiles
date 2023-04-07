# Dotfiles

My personal dotfiles configuration. Includes configs for vim, tmux, zsh, bash,
git, [i3], [kitty], VSCode, and more.

## Install

The install script works by symlinking dotfiles to their correct locations,
meaning edits to files affect settings immediately. The script also installs
Vim plugins using [Vundle].

To install, clone this repository to your favourite directory. I prefer
`~/apps`. Then, run the install script: `./install`

A copy of the Fira Code font is provided at etc/fonts. Terminal themes will use
this automatically.

### Recommended packages

Linux packages:

- bat
- fd
- fzf
- git-crypt
- git-delta
- neovim
- nnn
- python3-pylsp
- ripgrep
- universal-ctags
- zsh

Python packages:

- python-lsp-server[all]
- requests

Node packages:

- typescript
- typescript-language-server
- vscode-langservers-extracted

## TODO

- Consider moving the autocommit task from VSCode settings and making a `bin/` script out of it

### Package installation for Mac OS X

Run the brew installation script at etc/osx/brew-install.

Then add the .itermcolors theme file to iTerm2 for proper colour support.

[i3]: https://i3wm.org/
[kitty]: https://github.com/kovidgoyal/kitty
[Vundle]: https://github.com/VundleVim/Vundle.vim
