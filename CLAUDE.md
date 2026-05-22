# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Installation

Run `./install` from the repo root. The script symlinks everything under `src/` to the corresponding path under `$HOME`, so edits take effect immediately without re-running the installer. After a fresh install, open Neovim and run `:Lazy sync` to install plugins.

For macOS, also run `etc/osx/brew-install` to install required packages, then import one of the iTerm2 theme files from `etc/osx/` for correct colour support.

## Repository layout

- `src/` — all dotfiles, mirrored 1:1 to `$HOME`. The directory structure here is the home directory structure.
- `etc/` — auxiliary resources (macOS brew script, iTerm2 themes, wallpapers) that are not symlinked.
- `install` — the symlink installer script.

The shell config chain is: `.zshrc` (or `.bash_profile` / `.bashrc`) → sources `.commonrc`. All shell-agnostic aliases, env vars, and PATH additions live in `.commonrc`. Machine-specific overrides go in `~/.machinerc.<hostname>` and private/secret config in `~/.commonrc.private` — neither is versioned here.

## Neovim config

Config lives in `src/.config/nvim/`. Entry point is `init.lua`, which loads four top-level modules (`options`, `plugins`, `autocommands`, `keybindings`) and an optional per-project `project_config.lua`.

Plugin management uses **lazy.nvim** (auto-bootstrapped). All plugins are declared inline in `lua/plugins.lua`. Per-plugin setup is split into `lua/plugin/<name>.lua` files.

Key plugins:
- LSP: mason + mason-lspconfig + nvim-lspconfig
- Formatting: conform.nvim (black, isort, ruff, stylelint)
- Linting: nvim-lint (mypy, pylint, ruff, stylelint)
- Completion: nvim-cmp + LuaSnip
- Fuzzy finder: Telescope
- Symbol nav: Aerial (opens on the left edge)
- Debugger: nvim-dap + nvim-dap-python + nvim-dap-ui
- Theme: tokyonight.nvim, auto-switching dark/light via `auto-dark-mode.nvim`

To add a new plugin, add an entry to `lua/plugins.lua`. Config beyond `opts = {}` goes in a new `lua/plugin/<name>.lua` and is called via `config = function() require("plugin.<name>") end`.

## tmux

Prefix key is backtick (`` ` ``). Notable non-default bindings:
- `` ` v `` / `` ` s `` — vertical / horizontal split
- `` ` x `` / `` ` X `` — kill pane / kill window
- `C-h/j/k/l` — navigate panes (shared with vim via vim-tmux-navigator)
- `` ` R `` — reload tmux config

## Shell aliases worth knowing

- `ta` — attach to existing tmux session or create one named `default`
- `v` / `vi` — nvim
- `g` — git
- `cdg` — cd to git repo root
- `venv-activate` — sources `.venv`, `venv`, or `.virtualenv` in CWD
- `mkdirvenv` — create a fresh `.venv` virtualenv with a `bin/` symlink
