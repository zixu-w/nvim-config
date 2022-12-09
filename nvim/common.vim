" Common VIM settings

set nocompatible

" Disable netrw
let g:loaded_netrw       = 1
let g:loaded_netrwPlugin = 1

set bs=indent,eol,start                   " Allow backspace across lines
set viminfo='20,\"50                      "
set history=1000                          "
set autoread                              " Auto read when file is changed elsewhere
set diffopt+=vertical                     " Use vertical diffs
set ruler                                 " Show statusline ruler
set number                                " Show line number
set incsearch                             " Incremental search
set tabstop=2 shiftwidth=2 softtabstop=2  " Set tab width to 2
set expandtab                             " Insert tab as spaces
set autoindent                            " Keep indentation level on new lines
set smartindent                           " Use syntax indentation
set ffs=unix                              " Force \n line endings
set list listchars=tab:»·,trail:·,nbsp:☠  " Display extra whitespace
set showcmd                               " Display incomplete commands
set splitbelow                            " Split to bottom
set termguicolors                         " Use 24-bit 'true colors'
set undolevels=1000                       " More undo history
set encoding=utf-8
set updatetime=100
set completeopt-=preview
set noequalalways

syntax on
set hlsearch

" Disable gvim cursor blink
set guicursor+=a:blinkon0

" Highlight cursorline
set cursorline

" Enable mouse
set mouse=a

" Mappings
" Go to file in vertical split
nnoremap <Leader>vgf :vertical wincmd f<CR>
" Go to file in horizontal split
nnoremap <Leader>sgf :wincmd f<CR>

" Autocommands
if has("autocmd")
  augroup autocommands
  autocmd!
  " Jump to last known cursor location when editing a file,
  " except for git commit messages, or invalid locations.
  autocmd BufReadPost *
  \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
  \   exe "normal! g'\"" |
  \ endif
  " Open help in vertical window
  autocmd FileType help wincmd L
  autocmd BufNewFile,BufReadPre /media/*,/run/media/*,/mnt/* set directory=~/tmp,/var/tmp,/tmp
  autocmd FileType gitcommit,gitrebase,gitconfig set bufhidden=delete
  augroup END
endif
