-- Toggle nvim-tree with Crtl-o
vim.keymap.set('n', '<C-o>', ':NvimTreeToggle<CR>')

-- Auto close nvim-tree
-- nvim-tree is also there in modified buffers so this function filter it out
local modifiedBufs = function(bufs)
  local t = 0
  for k, v in pairs(bufs) do
    if v.name:match('NvimTree_') == nil then
      t = t + 1
    end
  end
  return t
end

vim.api.nvim_create_autocmd('BufEnter', {
  nested = true,
  callback = function()
    if #vim.api.nvim_list_wins() == 1 and
    vim.api.nvim_buf_get_name(0):match('NvimTree_') ~= nil and
    modifiedBufs(vim.fn.getbufinfo({bufmodified = 1})) == 0 then
      vim.cmd('quit')
    end
  end
})

vim.api.nvim_create_autocmd('BufEnter', {
  nested = true,
  callback = function()
    if #vim.api.nvim_list_wins() == 1 and
    require('nvim-tree.utils').is_nvim_tree_buf() then
      vim.cmd "quit"
    end
  end
})

require('nvim-tree').setup({
  sort_by = 'case_sensitive',
  open_on_setup = true,
  sync_root_with_cwd = true,
  respect_buf_cwd = true,
  view = {
    side = 'left',
    width = 30,
    adaptive_size = false,
    preserve_window_proportions = true,
    mappings = {
      list = {
        { key = 'u', action = 'dir_up' },
        { key = 's', action = 'vsplit' },
      },
    },
  },
  actions = {
    open_file = {
      resize_window = false,
      window_picker = {
        enable = false,
      },
    },
  },
  renderer = {
    group_empty = true,
    highlight_git = true,
    indent_markers = {
      enable = true,
    },
  },
  filters = {
    dotfiles = true,
  },
  diagnostics = {
    enable = true,
  },
  git = {
    enable = true,
    ignore = false,
  },
})
