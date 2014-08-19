set nocompatible
filetype off

" Initialize Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'Lokaltog/vim-distinguished'
Plugin 'bling/vim-airline'
Plugin 'vim-scripts/twilight256.vim'
Plugin 'dsolstad/vim-wombat256i'
Plugin 'scrooloose/syntastic'
Plugin 'Valloric/YouCompleteMe'
Plugin 'chikamichi/mediawiki.vim'
Plugin 'tpope/vim-surround'

call vundle#end()
filetype plugin indent on

let g:airline_powerline_fonts = 1
set t_Co=256
syntax on
colorscheme distinguished
let g:airline_theme="wombat"
set laststatus=2
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
set ruler
set background=dark 
" Shut up, vim.
set noerrorbells
set vb
set t_vb= 

let g:syntastic_c_check_header = 1

set guioptions-=m
set guioptions-=T
set guioptions-=r
set guioptions-=L

" Keep those swap files out of my sight
set backupdir=~/.vimtmp,.
set directory=~/.vimtmp,.
