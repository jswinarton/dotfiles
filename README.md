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

### Notes about Python LSP

The current Python LSP/lint/format setup for neovim works almost perfectly out
of the box. However if you are working on a project that uses certain plugins
to Python tools you will need to install these in the virtualenv for that tool
that was provided by Mason.

e.g., for pylint, if you are in a project that requires pylint_pytest, to prevent errors,
install pylint_pytest in the Mason virtualenv:

```
[MASON_ROOT_DIR]/packages/pylint/venv/bin/pip install pylint_pytest
```

## TODO

- Consider moving the autocommit task from VSCode settings and making a `bin/` script out of it

### Package installation for Mac OS X

Run the brew installation script at etc/osx/brew-install.

Then add the .itermcolors theme file to iTerm2 for proper colour support.

[i3]: https://i3wm.org/
[kitty]: https://github.com/kovidgoyal/kitty
[Vundle]: https://github.com/VundleVim/Vundle.vim
