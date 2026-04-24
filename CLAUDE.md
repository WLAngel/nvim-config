# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a Neovim configuration built on [LazyVim](https://lazyvim.org). It uses **lazy.nvim** as the plugin manager and follows LazyVim's conventions for extending/overriding defaults.

## Architecture

### Load sequence

1. `init.lua` → requires `config.lazy`
2. `lua/config/lazy.lua` → bootstraps lazy.nvim, defines the plugin spec (LazyVim base + language extras + `lua/plugins/`)
3. LazyVim auto-sources (in order):
   - `lua/config/options.lua` — vim options, loaded before plugins
   - `lua/config/keymaps.lua` — keymaps, loaded on `VeryLazy`
   - `lua/config/autocmds.lua` — autocommands, loaded on `VeryLazy`
4. All files under `lua/plugins/` are auto-imported by lazy.nvim

### Plugin organization (`lua/plugins/`)

Each file returns a table of lazy.nvim plugin specs that either add new plugins or override LazyVim defaults:

| File | Responsibility |
|------|---------------|
| `editor.lua` | flash.nvim (operator-pending disabled) + nvim-surround (`gS` remap) |
| `ui.lua` | Colorscheme (lunar), lualine search count, treesitter-context, scrollbar, noice/snacks tweaks |
| `git.lua` | vim-fugitive, copilot.vim, snacks git picker keymaps under `<leader>h` |
| `search.lua` | Snacks picker bindings (`<leader>f/F/t`), fzf + fzf.vim with custom `Rg`/`RG` commands |
| `lang.lua` | Shared treesitter parsers and Mason tools (language-specific tools stay in their LazyVim extras) |
| `which-key.lua` | Removes LazyVim's `<leader>c/d/f/g/q/w` group labels, disables many default `<leader>c*` LSP keys, adds `gs` for definition in vsplit |

### Language extras

Go, TypeScript, and PHP are handled entirely by LazyVim extras declared in `lua/config/lazy.lua`:
```lua
{ import = "lazyvim.plugins.extras.lang.go" },
{ import = "lazyvim.plugins.extras.lang.typescript" },
{ import = "lazyvim.plugins.extras.lang.php" },
```
`lang.lua` only manages parsers/tools that are shared globally (lua, bash, markdown, etc.).

### Key design decisions

- **`<leader>` namespace overhaul**: LazyVim's `<leader>g*` (git) and `<leader>c*` (code/LSP) groups are removed. Git lives under `<leader>h*`; `<leader>c` in visual mode copies to clipboard.
- **No system clipboard by default**: `vim.opt.clipboard = ""` — use `<leader>v` to paste from clipboard and `<leader>c` (visual) to copy to clipboard. SSH sessions use OSC52.
- **Mouse disabled**: `vim.opt.mouse = ""`.
- **Inlay hints off by default**: toggled with `<leader>oi`.
- **Bufferline disabled**: buffer navigation uses `<leader>y` → Snacks buffer picker.
- **`s`/`S` ownership**: flash.nvim owns `s`/`S` in normal + visual; nvim-surround uses `gS` in visual (not `S`) to avoid conflict.

### Custom keymap reference

| Key | Mode | Action |
|-----|------|--------|
| `<leader>f` | n | Find git files (Snacks) |
| `<leader>F` | n | Find files (cwd) |
| `<leader>t` | n | Find files (root dir) |
| `<leader>y` | n | Find buffers (Snacks) |
| `<leader>g` | n | Copy file path to clipboard |
| `<leader>c` | x | Copy selection to clipboard |
| `<leader>v` | n/x | Paste from clipboard |
| `<leader>w` | n | Delete buffer (`:bd`) |
| `<leader>r` | n | Delete buffer and return to previous (`bp \| bd#`) |
| `<leader>a` | n | Select all (`ggVG`) |
| `<leader>d` | n | Toggle diff mode |
| `<leader>i` | n/x | Format (normal: whole file, visual: selection) |
| `<leader>z` | n | Toggle zoom |
| `<leader>oi` | n | Toggle inlay hints |
| `<leader>ol` | n | Toggle wrap |
| `<leader>oc` | n | Toggle spell check |
| `gs` | n | Go to definition (vertical split) |
| `<leader>h{g,G}` | n | Lazygit (root / cwd) |
| `<leader>h{d,D,s,S,i,I,p,P}` | n | Git diff/status/stash/log pickers |
| `<leader>hb` | n | Git blame line |
| `<leader>hf` | n | Git file history |
| `<leader>hB` | n/x | Git browse (open URL) |
| `<leader>hY` | n/x | Git browse (copy URL) |

## Lua formatting

Configured via `stylua.toml`: 2-space indent, 120-column line width. The `stylua` binary is managed by Mason.

## Updating plugins

Run `:Lazy sync` inside Neovim. The lock file `lazy-lock.json` should be committed after intentional updates.
