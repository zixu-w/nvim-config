local lsp = require('lspconfig')
local lspconfig = require('config.lspconfig')

-- Rounded border for floating windows for LspInfo etc.
require('lspconfig.ui.windows').default_options = {
  border = 'rounded'
}

local setup_server = function(server, custom_config)
  custom_config = custom_config or {}
  server.setup(vim.tbl_deep_extend('force', lspconfig, custom_config))
end

-- Pyright
if vim.fn.executable('pyright-langserver') == 1 then
  setup_server(lsp.pyright)
end

-- Clangd
-- Setup in `clangd_extensions`

-- sourcekit-lsp for Swift
if vim.fn.executable('sourcekit-lsp') == 1 then
  -- let clangd handle C/C++/ObjC/ObjC++
  setup_server(lsp.sourcekit, { filetypes = { 'swift' } })
end

-- haskell-language-server
if vim.fn.executable('haskell-language-server-wrapper') == 1 and
   vim.fn.executable('ghc') == 1 and
   vim.fn.executable('stack') == 1 and
   vim.fn.executable('cabal') == 1 then
  setup_server(lsp.hls)
end
