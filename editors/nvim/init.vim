"# Plugins
call plug#begin()
" Sensible defaults
Plug 'tpope/vim-sensible'

" Solarized
Plug 'frankier/neovim-colors-solarized-truecolor-only'

" Autocomplete
Plug 'Shougo/deoplete.nvim'

" Add s selector (surrond)
Plug 'tpope/vim-surround'

" Git plugin
Plug 'tpope/vim-fugitive'

" Indent guides
Plug 'nathanaelkane/vim-indent-guides'

" MutiCursor
Plug 'terryma/vim-multiple-cursors'
call plug#end()

"# ColorScheme
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set termguicolors
"set t_Co=256
"let g:solarized_termcolors=256
set background=dark
colorscheme solarized
" Indent colors
let g:indent_guides_auto_colors = 0
"let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 2
let g:indent_guides_enable_on_vim_startup = 1
"autocmd VimEnter,Colorscheme * :hi! link IndentGuidesOdd LineNr
autocmd VimEnter,Colorscheme * :hi! link IndentGuidesEven LineNr

set cursorline


"# Autocomplete
let g:deoplete#enable_at_startup = 1



"# CONFIG
syntax on
filetype plugin indent on

let mapleader = ","
let g:mapleader = ","

set expandtab
set tabstop=4
set shiftwidth=4
set smarttab
set autoindent
set smartindent

set nu
set rnu

set nobackup
set nowb
set noswapfile

set ignorecase
set smartcase
set hlsearch
set showmatch
set magic
nnoremap <silent> <leader><space> :nohl<cr>

set scrolloff=7
set wildmenu
set wildignore=.git\*

set cmdheight=1
set ruler
set mouse=
