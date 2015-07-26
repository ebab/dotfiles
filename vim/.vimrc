" Erik's .vimrc
" =============

set nocompatible
filetype off

" Vundle
" ------

" Initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Plugins
Plugin 'gmarik/Vundle.vim'
Plugin 'bling/vim-airline'
Plugin 'chikamichi/mediawiki.vim'
Plugin 'tpope/vim-surround'
Plugin 'cespare/vim-toml'
Plugin 'w0ng/vim-hybrid'
Plugin 'Lokaltog/vim-distinguished'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'morhetz/gruvbox'
Plugin 'digitaltoad/vim-jade.git'

call vundle#end()

autocmd BufNewFile,BufReadPost *.md set filetype=markdown

filetype plugin indent on


" Preferences
" -----------

" Status line
set laststatus=2
set ruler

" Tabs and spaces
set tabstop=4
set shiftwidth=4
set expandtab
set smarttab

set showcmd
set number
set showmatch
set hlsearch
set incsearch
set ignorecase
set smartcase
set backspace=2
set autoindent
set textwidth=79
set formatoptions=c,q,r,t
set background=dark 

" No beeping/flashing
set noerrorbells
set vb
set t_vb= 

" Hide gvim GUI
set guioptions-=m
set guioptions-=T
set guioptions-=r
set guioptions-=L

set backupdir=~/.vim/backup
set noswapfile

set undofile
set undodir=~/.vim/undodir
set undolevels=1000
set undoreload=10000

" Show tabs and trailing characters.
set listchars=tab:»·,trail:·
set list

" Plugin settings
" ---------------

" Airline
let g:airline_powerline_fonts = 1
let g:airline_theme="wombat"


" Shortcuts
" ---------

let mapleader="\<Space>"

" Easier split navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Colors
set t_Co=256
syntax on
colorscheme distinguished

" HTML indentation
autocmd FileType html setlocal shiftwidth=2 tabstop=2

" When editing a file, always jump to the last cursor position
autocmd BufReadPost *
\ if line("'\"") > 0 && line ("'\"") <= line("$") |
\   exe "normal! g'\"" |
\ endif
