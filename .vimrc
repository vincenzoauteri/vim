set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'pangloss/vim-javascript'
Plugin 'othree/html5.vim'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-commentary'
Plugin 'vim-scripts/matchit.zip'
Plugin 'tpope/vim-surround'

call vundle#end()            " required
filetype plugin indent on    " required
set grepprg=grep\ -n
set guifont=Monaco:h14
colorscheme twilight256

set autoindent
set cindent
set cino=(0

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

set showmatch
set guioptions-=T
set vb t_vb=
set ruler
set nohls
set incsearch
set virtualedit=all
set modelines=0

set encoding=utf-8
set scrolloff=3
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set visualbell
set ttyfast
set backspace=indent,eol,start
set laststatus=2
set relativenumber
set ignorecase
set smartcase
set nowrap
set textwidth=79
set formatoptions=qrn1
set colorcolumn=80
set nobackup
set noswapfile
set hlsearch 

inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>
                                                                          :
nnoremap <Leader>h :set hlsearch<Return>
nnoremap <Leader>H :set nohlsearch<Return>

nnoremap <Leader>g :grep -R --include=*.c  --include=*.h  --include=*.cpp  --include=*.C  --include=*.H  --include=*.CPP .<Left><Left>  
nnoremap <Leader>s :grep -R --include=*.c  --include=*.h  --include=*.cpp  --include=*.C  --include=*.H  --include=*.CPP <C-R><C-W> .<CR>
nnoremap <Leader>w :cw <CR>
nnoremap <Leader>n <C-x><C-n>
nnoremap <Leader>l <C-x><C-l>
nnoremap <Leader>{ O{<Esc>jo}<Esc>k==
nnoremap <Leader>c ^i//<Esc>    
nnoremap <Leader>C ^xx  
nnoremap <Leader>p ^dawiLOG_PRINTF(<Esc>$F)a,LOG_DEBUG)<Esc>
nnoremap <Leader>; $a;<Esc>0
nnoremap <Leader>b :buffers<Return>:b  
nnoremap <Leader>* d$k/*\/<Return>ji*/<Esc>j0   

filetype plugin indent on
syntax on
