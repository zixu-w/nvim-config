" Load basic settings that might be shared with VIM
runtime common.vim

" Load color scheme settings
runtime colorscheme.vim

if has('nvim')
  " Load Neovim settings and plugins
  lua require('nvimrc')
  lua require('plugins')
else
  " Load Vim specific settings
  " Setup Vundle plugins etc.
  runtime vimrc.vim
endif

" Load additional custom settings
runtime llvm.vim    " LLVM VIM settings
