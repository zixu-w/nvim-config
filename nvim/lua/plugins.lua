local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ 'git', 'clone', '--depth', '1',
                'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup({function(use)
  use 'wbthomason/packer.nvim'

  use 'lifepillar/vim-solarized8'

  use { 'junegunn/fzf', run = ':call fzf#install()' }
  use {
    'ibhagwan/fzf-lua',
    requires = { 'nvim-tree/nvim-web-devicons' },
    config = function() require('config.fzf-lua') end,
  }
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons' },
    config = function() require('config.lualine') end,
  }
  use 'tpope/vim-surround'
  use 'tpope/vim-fugitive'
  use {
    'windwp/nvim-autopairs',
    config = function() require('config.nvim-autopairs') end,
  }
  use {
    'nvim-tree/nvim-tree.lua',
    requires = { 'nvim-tree/nvim-web-devicons' },
    config = function() require('config.nvim-tree') end,
  }
  use {
    'lewis6991/gitsigns.nvim',
    config = function() require('config.gitsigns') end,
  }
  use {
    'hrsh7th/nvim-cmp',
    requires = {
      { 'hrsh7th/cmp-nvim-lsp', after = 'nvim-cmp' },
      { 'hrsh7th/cmp-buffer', after = 'nvim-cmp' },
      { 'hrsh7th/cmp-path', after = 'nvim-cmp' },
      { 'hrsh7th/cmp-cmdline', after = 'nvim-cmp' },
      'L3MON4D3/LuaSnip',
      { 'saadparwaiz1/cmp_luasnip', after = 'nvim-cmp' },
      'onsails/lspkind.nvim',
    },
    after = 'nvim-autopairs',
    config = function() require('config.nvim-cmp') end,
  }
  use {
    'neovim/nvim-lspconfig',
    after = 'cmp-nvim-lsp',
    config = function() require('config.lsp-servers-setup') end,
  }
  use {
    'p00f/clangd_extensions.nvim',
    ft = { 'c', 'cpp' },
    after = 'nvim-lspconfig',
    config = function() require('config.clangd_extensions') end,
  }
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = function() require('config.nvim-treesitter') end,
  }
  use {
    'nvim-treesitter/nvim-treesitter-context',
    config = function() require('config.nvim-treesitter-context') end,
  }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end,
config = {
  display = {
    open_fn = function()
      return require('packer.util').float({ border = 'rounded' })
    end,
  }
}})
