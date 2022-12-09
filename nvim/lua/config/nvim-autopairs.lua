local Rule = require('nvim-autopairs.rule')
local npairs = require('nvim-autopairs')
local cond = require('nvim-autopairs.conds')

npairs.setup({
  -- Default values
  -- disable_filetype = { 'TelescopePrompt' },
  -- disable_in_macro = false,  -- disable when recording or executing a macro
  -- disable_in_visualblock = false, -- disable when insert after visual block mode
  -- disable_in_replace_mode = true,
  -- ignored_next_char = [=[[%w%%%'%[%"%.%`%$]]=],
  -- enable_moveright = true,
  -- enable_afterquote = true,  -- add bracket pairs after quote
  -- enable_check_bracket_line = true,  --- check bracket in same line
  -- enable_bracket_in_quote = true, --
  -- enable_abbr = false, -- trigger abbreviation
  -- break_undo = true, -- switch for basic rule break undo sequence
  -- map_cr = true,
  -- map_bs = true,  -- map the <BS> key
  -- map_c_h = false,  -- Map the <C-h> key to delete a pair
  -- map_c_w = false, -- map <c-w> to delete a pair if possible
  check_ts = true, -- use treesitter to check for pair
  ts_config = {
    -- lua = {'string'},-- it will not add a pair on that treesitter node
    -- javascript = {'template_string'},
    -- java = false,-- don't check treesitter on java
  },
})

-- Add custom rules

-- Space between brackets
-- Before        Input         After
------------------------------------
-- (|)            ' '          ( | )
------------------------------------
-- ( | )          ')'           ( )|
------------------------------------
local brackets = { { '(', ')' }, { '[', ']' }, { '{', '}' } }
npairs.add_rules {
  Rule(' ', ' ')
    :with_pair(function(opts)
      local pair = opts.line:sub(opts.col -1, opts.col)
      return vim.tbl_contains({
        brackets[1][1]..brackets[1][2],
        brackets[2][1]..brackets[2][2],
        brackets[3][1]..brackets[3][2]
      }, pair)
    end)
    :with_move(cond.none())
    :with_cr(cond.none())
    :with_del(function(opts)
      local col = vim.api.nvim_win_get_cursor(0)[2]
      local context = opts.line:sub(col - 1, col + 2)
      return vim.tbl_contains({
        brackets[1][1]..'  '..brackets[1][2],
        brackets[2][1]..'  '..brackets[2][2],
        brackets[3][1]..'  '..brackets[3][2]
      }, context)
    end)
}
for _,bracket in pairs(brackets) do
  Rule('', ' '..bracket[2])
    :with_pair(cond.none())
    :with_move(function(opts) return opts.char == bracket[2] end)
    :with_cr(cond.none())
    :with_del(cond.none())
    :use_key(bracket[2])
end

-- Move past commas and semicolons
for _,punct in pairs { ',', ';' } do
  npairs.add_rules {
    Rule('', punct)
      :with_move(function(opts) return opts.char == punct end)
      :with_pair(function() return false end)
      :with_del(function() return false end)
      :with_cr(function() return false end)
      :use_key(punct)
  }
end

--[[
npairs.add_rule(Rule('$$', '$$', 'tex'))

-- you can use some built-in conditions
print(vim.inspect(cond))

npairs.add_rules({
  Rule('$', '$', { 'tex', 'latex' })
    -- don't add a pair if the next character is %
    :with_pair(cond.not_after_regex('%%'))
    -- don't add a pair if  the previous character is xxx
    :with_pair(cond.not_before_regex('xxx', 3))
    -- don't move right when repeat character
    :with_move(cond.none())
    -- don't delete if the next character is xx
    :with_del(cond.not_after_regex('xx'))
    -- disable adding a newline when you press <cr>
    :with_cr(cond.none())
  },
  -- disable for .vim files, but it work for another filetypes
  Rule('a', 'a', '-vim')
)

npairs.add_rules({
  Rule('$$', '$$', 'tex')
    :with_pair(function(opts)
        print(vim.inspect(opts))
        if opts.line=='aa $$' then
        -- don't add pair on that line
          return false
        end
    end)
   }
)

-- you can use regex
-- press u1234 => u1234number
npairs.add_rules({
    Rule('u%d%d%d%d$', 'number', 'lua')
      :use_regex(true)
})



-- press x1234 => x12341234
npairs.add_rules({
    Rule('x%d%d%d%d$', 'number', 'lua')
      :use_regex(true)
      :replace_endpair(function(opts)
          -- print(vim.inspect(opts))
          return opts.prev_char:sub(#opts.prev_char - 3,#opts.prev_char)
      end)
})


-- you can do anything with regex +special key
-- example press tab to uppercase text:
-- press b1234s<tab> => B1234S1234S

npairs.add_rules({
  Rule('b%d%d%d%d%w$', '', 'vim')
    :use_regex(true,"<tab>")
    :replace_endpair(function(opts)
          return
              opts.prev_char:sub(#opts.prev_char - 4,#opts.prev_char)
              ..'<esc>viwU'
    end)
})

-- you can exclude filetypes
npairs.add_rule(
  Rule('$$', '$$')
    :with_pair(cond.not_filetypes({ 'lua' }))
)
--- check ./lua/nvim-autopairs/rules/basic.lua
]]--
