# Dotfiles

My personal dotfiles configuration. Includes configs for vim, tmux, zsh, bash,
git, [i3], [kitty], VSCode, and more.

## Install

The install script works by symlinking dotfiles to their correct locations,
meaning edits to files affect settings immediately. The script also installs
Vim plugins using [Vundle].

To install, clone this repository to your favourite directory. I prefer
`~/apps`. Then, run the install script: `./install`

## Recommended packages on Linux

- bat
- fd
- fzf
- git-crypt
- git-delta
- neovim >= 5.0
- nodejs >= 12.0 (coc.nvim dependency)
- ripgrep
- universal-ctags
- zsh

## TODO

- Consider moving the autocommit task from VSCode settings and making a `bin/` script out of it

[i3]: https://i3wm.org/
[kitty]: https://github.com/kovidgoyal/kitty
[Vundle]: https://github.com/VundleVim/Vundle.vim
