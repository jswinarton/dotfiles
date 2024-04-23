# Dotfiles

My personal dotfiles configuration. Includes configs for neovim, tmux, zsh, bash,
git, [i3], [kitty] and more.

## Install

The install script works by symlinking dotfiles to their correct locations,
meaning edits to files affect settings immediately. The script also installs
Neovim plugins using Packer.

To install, clone this repository to your favourite directory. I prefer
`~/apps`. Then, run the install script: `./install`

Some terminal configs make use of Powerline and/or NerdFont symbols.
Recommended typeface is
[NerdFont-patched JetBrains mono](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/JetBrainsMono).

### Recommended packages

Linux packages:

- bat
- fd
- fzf
- git-delta
- neovim
- nnn
- ripgrep
- zsh

Python packages:

- requests

Pipx packages:

- pudb (with injected ipython, rich)
- ipython (with injected rich)

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

### Package installation for Mac OS X

Run the brew installation script at etc/osx/brew-install.

Then add the .itermcolors theme file to iTerm2 for proper colour support.


[i3]: https://i3wm.org/
[kitty]: https://github.com/kovidgoyal/kitty
