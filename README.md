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
- ripgrep
- universal-ctags
- zsh

Python packages:

- requests

Node packages:

- typescript
- typescript-language-server
- vscode-langservers-extracted

### Notes about Python LSP

At the moment, Mason works by installing Python language servers in a
virtualenv. While this works if you are using system Python, if you have your
Python in a different venv, this will not work because it overrides your venv,
and you get a bunch of import errors because it can't see the imports in your
Python path.

The way to fix this is to:
1. Configure mason to *append* to virtualenv to the PATH (instead of prepend, the default)
2. Manually install python LSP tools into the virtualenv you are developing in

If this causes problems with other servers you could consider manually adding
the mason stuff to the path(?)

Command is pip install "python-lsp-server[all]" pyls-isort python-lsp-black pylsp-rope pynvim

TODO need to figure out how to install the plugins over and above pylsp with
mason in a repeatable way

## TODO

- Consider moving the autocommit task from VSCode settings and making a `bin/` script out of it

### Package installation for Mac OS X

Run the brew installation script at etc/osx/brew-install.

Then add the .itermcolors theme file to iTerm2 for proper colour support.

[i3]: https://i3wm.org/
[kitty]: https://github.com/kovidgoyal/kitty
[Vundle]: https://github.com/VundleVim/Vundle.vim
