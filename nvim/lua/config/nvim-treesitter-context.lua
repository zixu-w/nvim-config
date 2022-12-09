-- The original link to NormalFloat was cleared for prettier floating windows.
vim.api.nvim_set_hl(0, 'TreesitterContext', { link = 'Pmenu' })

require('treesitter-context').setup({
  -- Enable this plugin (Can be enabled/disabled later via commands)
  enable = true,

  -- How many lines the window should span. Values <= 0 mean no limit.
  max_lines = 0,

  -- Which context lines to discard if `max_lines` is exceeded.
  -- Choices: 'inner', 'outer'
  trim_scope = 'outer',

  -- Match patterns for TS nodes. These get wrapped to match at word boundaries.
  patterns = {
    -- For all filetypes
    -- Note that setting an entry here replaces all other patterns for this
    -- entry. By setting the 'default' entry below, you can control which nodes
    -- you want to appear in the context window.
    default = {
      'class',
      'function',
      'method',
      'for',
      'while',
      'if',
      'switch',
      'case',
    },
    -- Example for a specific filetype.
    -- If a pattern is missing, *open a PR* so everyone can benefit.
    --   rust = {
    --       'impl_item',
    --   },
  },
  exact_patterns = {
    -- Example for a specific filetype with Lua patterns
    -- Treat patterns.rust as a Lua pattern (i.e "^impl_item$" will
    -- exactly match "impl_item" only)
    -- rust = true,
  },

  -- [!] The options below are exposed but shouldn't require your attention,
  --     you can safely ignore them.

  -- The Z-index of the context window
  zindex = 20,

  -- Line used to calculate context. Choices: 'cursor', 'topline'
  mode = 'topline',
  separator = nil,
})
