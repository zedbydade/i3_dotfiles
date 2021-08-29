
" Nvim Configs
set completeopt=menuone,noselect,noinsert
set shortmess+=c
set expandtab
set smartindent
set tabstop=4 softtabstop=4
set cmdheight=2
set updatetime=50
set signcolumn=yes
syntax enable
colorscheme gruvbox
set wildmenu " when opening a file with e.g. :e ~/.vim<TAB> there is a graphical menu of all the matches
set ttyfast
set lazyredraw
set updatetime=300
hi Normal guibg=NONE
set hidden " Open other files if current one is not saved
set number
set numberwidth=4
set ruler
set relativenumber
map j gj
map k gk
set autoindent
set cindent
set smartindent
set foldmethod=syntax
set foldlevel=99
nmap z za
set noerrorbells visualbell t_vb=
set updatetime=100
set shiftwidth=4
autocmd BufWritePre * :%s/\s\+$//e
set encoding=utf-8
set termencoding=utf-8
set nobackup
set nowritebackup
set noswapfile
set ignorecase
set smartcase
set nohlsearch
set incsearch
set laststatus=2
set clipboard=unnamed
set backspace=indent,eol,start

" Spellcheck for features and markdown
au BufRead,BufNewFile *.md setlocal spell
au BufRead,BufNewFile *.md.erb setlocal spell
au BufRead,BufNewFile *.feature setlocal spell

" If fzf installed using git
set rtp+=~/.fzf

" Fix some weird error with Fugitive
let g:fugitive_pty = 0

" Change cursor to solid vertical line
" There are problems with Vim's floating window setting cursor to a solid
" block. So these lines below are resetting it to a solid vertical line.
let &t_SI = "\e[6 q"
let &t_EI = "\e[6 q"
