set nocompatible
set hidden
set noswapfile
set nobackup
set colorcolumn=80
set textwidth=79
set nowrap
set ignorecase
set smartcase
set relativenumber
set backspace=indent,eol,start
set visualbell

let mapleader = "\\"
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

" VIM Configuration File
" Description: Optimized for C/C++ development, but useful also for other things.
" Author: Gerhard Gappmeier
"
 
colors late
set guifont=Consolas:h11:cANSI
" set UTF-8 encoding
set enc=utf-8
set fenc=utf-8
set termencoding=utf-8
" disable vi compatibility (emulation of old bugs)
set nocompatible
" use indentation of previous line
set autoindent
" use intelligent indentation for C
set smartindent
" configure tabwidth and insert spaces instead of tabs
set tabstop=4        " tab width is 4 spaces
set shiftwidth=4     " indent also with 4 spaces
set expandtab        " expand tabs to spaces
" wrap lines at 120 chars. 80 is somewaht antiquated with nowadays displays.
set textwidth=120
" turn syntax highlighting on
set t_Co=256
syntax on
" colorscheme wombat256
" turn line numbers on
set number
" highlight matching braces
set showmatch
" intelligent comments
set comments=sl:/*,mb:\ *,elx:\ */
 
" Install OmniCppComplete like described on http://vim.wikia.com/wiki/C++_code_completion
" This offers intelligent C++ completion when typing . -> or <C-o>
" Load standard tag files
set tags+=~/.vim/tags/cpp
set tags+=~/.vim/tags/gl
set tags+=~/.vim/tags/sdl
set tags+=~/.vim/tags/qt4
 
" Install DoxygenToolkit from http://www.vim.org/scripts/script.php?script_id=987
let g:DoxygenToolkit_authorName="John Doe <john@doe.com>"
 
" Enhanced keyboard mappings
"
"recursive replace 
"nmap <Leader>r  /<C-R>-<CR>vw".p
nmap <Leader>r  :%s /<C-R>-/<C-R>./gc<CR>

"struct template
nmap <Leader>s  ^istruct <ESC>$a{<CR>};<ESC>O  

"if template
nmap <Leader>( Bi(<ESC>Aa)<ESC>

"encapsulate condition in parenthesis 
nmap <Leader>i ^iif(<ESC>A){<CR>}<ESC>O

"edit file in register 1
nmap <Leader>1 :buffer <C-R>1<CR>

"edit file in register 2
nmap <Leader>2 :buffer <C-R>2<CR>

"edit file in register 3
nmap <Leader>3 :buffer <C-R>3<CR>

"see cheatsheet vimrc
nmap <F1> :e $home\cheatsheet.vim<CR>
"see cheatsheet vimrc
nmap <Leader><F1> :!ctags -R .<CR>
"edit vimrc
nmap <Leader><F12> :source $home\_vimrc<CR>
" in normal mode F2 will save the file
nmap <f2> :w<cr>
" in insert mode f2 will exit insert, save, enters insert again
imap <F2> <ESC>:w<CR>i
" switch between header/source with F4
map <F4> :e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>
" recreate tags file with F5
map <F5> :!ctags -R c++-kinds=+p fields=+iaS extra=+q .<CR>
" create doxygen comment
map <F6> :Dox<CR>
" build using makeprg with <F7>
"map <F7> :make<CR>
map <F7> <C-w>o<C-w>10s:wa<CR>:e out<CR>ggdG:read !build.bat<CR>gg<C-w>j

map <Leader>c <C-w>o<C-w>10s:wa<CR>:e out<CR>ggdG:read !build.bat<CR>gg<C-w>j
" build using makeprg with <S-F7>
map <S-F7> :make clean all<CR>
" goto definition with F12
map <F11> <C-]>
" in diff mode we use the spell check keys for merging

"edit vimrc
nmap <F12> :e $home\_vimrc<CR>
"edit vimrc
nmap <Leader><F12> :source $home\_vimrc<CR>
" in normal mode F2 will save the file
if &diff
   diff settings
  map <M-Down> ]c
  map <M-Up> [c
  map <M-Left> do
  map <M-Right> dp
  map <F9> :new<CR>:read !svn diff<CR>:set syntax=diff buftype=nofile<CR>gg
else
  " spell settings
  :setlocal spell spelllang=en
  " set the spellfile - folders must exist
  set spellfile=~/.vim/spellfile.add
  map <M-Down> ]s
  map <M-Up> [s
endif

nnoremap h <ESC>
nnoremap j <ESC>
nnoremap k <ESC>
nnoremap l <ESC>
