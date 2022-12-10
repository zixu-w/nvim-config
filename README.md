## Requirements

- [Homebrew](https://brew.sh)
- A patched font: [Nerd Fonts](https://github.com/ryanoasis/nerd-fonts), [Powerline](https://github.com/powerline/fonts), etc.

## Install

Clone this repository anywhere you like, for example `~/.nvim-config`, and
run the `install.sh` script inside the repo.
```
git clone https://github.com/zixu-w/nvim-config.git ~/.nvim-config
cd ~/.nvim-config
./install.sh
```
It will install necessary packages, and create a symbolic link to the
configuration files at `~/.config/nvim`. Existing directory will be backed up.

## Features

- Modular Lua configurations for modern neovim
- [Packer](https://github.com/wbthomason/packer.nvim)-managed plugins
- [fzf](https://github.com/junegunn/fzf) and [fzf-lua](https://github.com/ibhagwan/fzf-lua) for files and content searching with `fd` and `ripgrep`
- [lualine](https://github.com/nvim-lualine/lualine.nvim) status line
- [nvim-tree](https://github.com/nvim-tree/nvim-tree.lua) file explorer
- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)-powered highlighting, folding, and context support
- Builtin LSP and diagnostics configurations
- [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)-managed LSP servers
- Auto-completion powered by [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)
- Extra clangd LSP support from [clangd_extensions.nvim](https://github.com/p00f/clangd_extensions.nvim)
