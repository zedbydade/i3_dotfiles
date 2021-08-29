" This script contains  a list of Vim-Plugged plugins
runtime configs/plugins.vim

" This script contains functions
runtime configs/functions.vim

" This script contains mapppings
runtime configs/mapping.vim

" This script contains general neovim settings
runtime configs/main.vim

" This script contains general neovim lsp settings
runtime configs/lsp.vim

set nocompatible " be iMproved, required

filetype off     " required

" Keep Plug commands between plug#begin() and plug#end().
filetype plugin indent on    " required

if has('termguicolors')
  set termguicolors
endif

if executable('rg')
    let g:rg_derive_root='true'
endif

lua require("legolas")




