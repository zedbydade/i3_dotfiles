"#####################################################################################################
"                           ____     __                     _
"                          / __ \   / /  __  __   ____ _   (_)   ____    _____
"                         / /_/ /  / /  / / / /  / __ `/  / /   / __ \  / ___/
"                        / ____/  / /  / /_/ /  / /_/ /  / /   / / / / (__  )
"                       /_/      /_/   \__,_/   \__, /  /_/   /_/ /_/ /____/
"                                              /____/
"######################################################################################################

call plug#begin()

Plug 'janko/vim-test'             " Run Ruby and Elixir tests
Plug 'nikolalsvk/vim-rails'       " Rails plugin

" Nvim LSP
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'

Plug 'airblade/vim-gitgutter'     " Show git diff of lines edited
Plug 'tpope/vim-fugitive'         " :Gblame

Plug 'tpope/vim-endwise'          " Autocomplete end after a do

Plug 'hoob3rt/lualine.nvim'

Plug 'thoughtbot/vim-rspec'       " Rspec Support

Plug 'terryma/vim-multiple-cursors'

Plug 'tpope/vim-surround'

Plug 'wakatime/vim-wakatime'

Plug 'gruvbox-community/gruvbox'

Plug 'ryanoasis/vim-devicons'
" All of your Plugins must be added before the following line
call plug#end()              " required
