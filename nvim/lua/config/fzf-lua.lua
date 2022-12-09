-- Include git-ignored files for files search
require('fzf-lua').setup({
  files = {
    fd_opts = "--color=never --type f --hidden --follow --exclude .git " ..
              "--no-ignore-vcs",
  },
})

-- Keymaps
vim.api.nvim_set_keymap('n', '<C-g>',
  "<cmd>lua require('fzf-lua').grep_project()<CR>",
  { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', ';',
  "<cmd>lua require('fzf-lua').files()<CR>",
  { noremap = true, silent = true })

vim.api.nvim_set_keymap('v', '<Leader>s',
  "<cmd>lua require('fzf-lua').grep_visual()<CR>",
  { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<Leader>w',
  "<cmd>lua require('fzf-lua').grep_cword()<CR>",
  { noremap = true, silent = true })
