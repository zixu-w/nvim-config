## Requirements

- [Homebrew](https://brew.sh)
- A patched font: [Nerd Fonts](https://github.com/ryanoasis/nerd-fonts), [Powerline](https://github.com/powerline/fonts), etc.

## Install

Clone this repository anywhere you like, for example `~/.nvim-config`, and
run the `install.sh` script.
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

##
###### Searching filenames with `;` and contents with `<C-g>`
![fzf](https://user-images.githubusercontent.com/9819235/206936522-cb360e7a-69f2-4ada-8336-52ee6600d4eb.gif)
---
###### Navigating files with [nvim-tree](https://github.com/nvim-tree/nvim-tree.lua)
![nvim-tree](https://user-images.githubusercontent.com/9819235/206936531-5aca7ca6-a36e-4780-955b-23932fe63549.gif)
---
###### Inline and popup diagnostics. Code actions (`<Leader>ca`) apply fixes
![diag](https://user-images.githubusercontent.com/9819235/206936537-42763ef8-d9de-46e7-a821-289b97f933a6.gif)
---
###### Hover info and symbol lookups with LSP
![lsp](https://user-images.githubusercontent.com/9819235/206936566-e1c74ab8-f936-4e68-a251-2242a87e9476.gif)
---
###### LSP code completion with documentation window
![cmp](https://user-images.githubusercontent.com/9819235/206936574-57d72aa0-017c-4447-85f8-e93e37cdfd71.gif)
