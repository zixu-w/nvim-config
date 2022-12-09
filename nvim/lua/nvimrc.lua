-- NeoVIM settings

--------------
-- Terminal --
--------------

-- More terminal history
vim.g.terminal_scrollback_buffer_size = 100000

-- Use existing nvim window to open new files
if vim.fn.executable('nvr') == 1 then
  vim.env.VISUAL = 'nvr --remote-wait'
  vim.env.EDITOR = 'nvr --remote-wait'
  vim.env.GIT_EDITOR = 'nvr -cc split --remote-wait'
end

-- Keymaps for openning terminal
vim.keymap.set('n', '<Leader>t', function()
  vim.api.nvim_command('split')
  vim.api.nvim_command('terminal')
  vim.api.nvim_command('resize 12')
end)
vim.keymap.set('n', '<Leader>T', function()
  vim.api.nvim_command('vsplit')
  vim.api.nvim_command('terminal')
end)
-- Use Esc to go to normal mode in terminal
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>')

local termGroup = vim.api.nvim_create_augroup('termCmds', { clear = true })
vim.api.nvim_create_autocmd('TermOpen', {
  pattern = '*',
  group = termGroup,
  desc = 'Disable line numbers in terminal',
  callback = function()
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
  end
})
vim.api.nvim_create_autocmd('TermOpen', {
  pattern = '*',
  group = termGroup,
  desc = 'Soft line wrapping in terminal',
  callback = function()
    vim.opt_local.wrap = true
  end
})
vim.api.nvim_create_autocmd('TermOpen', {
  pattern = '*',
  group = termGroup,
  desc = 'Start insert when openning terminal',
  callback = function()
    vim.api.nvim_command('startinsert')
  end
})


---------------------
-- LSP/Diagnostics --
---------------------

-- Better diagnostic signs.
local signs = { Error = ' ', Warn = ' ', Hint = ' ', Info = ' ' }
for type, icon in pairs(signs) do
  local hl_sign = 'DiagnosticSign' .. type
  vim.fn.sign_define(hl_sign, { text = icon, texthl = hl_sign, numhl = '' })
end

vim.diagnostic.config({
  virtual_text = {
    prefix = '●', -- Could be '■', '▎', 'x'
    source = true,
  },
  float = {
    source = true,
  },
  severity_sort = true,
})

-- Use bordered floating windows.
local set_hl_for_floating_window = function()
  vim.api.nvim_set_hl(0, 'NormalFloat', {
    link = 'Normal',
  })
  vim.api.nvim_set_hl(0, 'FloatBorder', {
    bg = 'none',
  })
end

set_hl_for_floating_window()

vim.api.nvim_create_autocmd('ColorScheme', {
  pattern = '*',
  desc = 'Avoid overwritten by loading color schemes later',
  callback = set_hl_for_floating_window,
})

local _border = 'rounded'

local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
  opts = opts or {}
  opts.border = opts.border or _border
  return orig_util_open_floating_preview(contents, syntax, opts, ...)
end

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<Leader>d', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)
