vim.opt.laststatus = 2
vim.opt.showmode = false

require('lualine').setup({
  options = {
    icons_enabled = true,
    theme = 'solarized_dark',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},

    -- Filetypes to disable lualine for.
    disabled_filetypes = {
      -- only ignores the ft for statusline.
      statusline = {},
      -- only ignores the ft for winbar.
      winbar = {},
    },

    -- If current filetype is in this list it'll always be drawn as inactive
    -- statusline and the last window will be drawn as active statusline.
    -- For example if you don't want statusline of your file tree/sidebar window
    -- to have active statusline you can add their filetypes here.
    ignore_focus = {},

    -- When set to true, left sections i.e. 'a','b' and 'c' can't take over the
    -- entire statusline even if neither of 'x', 'y' or 'z' are present.
    always_divide_middle = true,

    -- Enable global statusline (have a single statusline at bottom of neovim
    -- instead of one for  every window).
    -- This feature is only available in neovim 0.7 and higher.
    globalstatus = false,

    -- Sets how often lualine should refreash it's contents (in ms).
    -- The refresh option sets minimum time that lualine tries to maintain
    -- between refresh. It's not guarantied if situation arises that lualine
    -- needs to refresh itself before this time it'll do it.
    -- Also you can force lualine's refresh by calling refresh function like
    -- require('lualine').refresh()
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', { 'diagnostics', sources = {"nvim_lsp"}, symbols = {error = ' ', warn = ' ', info = ' ', hint = ' '} }},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {
    'fugitive',
    'nvim-tree',
    'fzf',
  }
})
