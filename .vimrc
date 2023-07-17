
" THE FOLLOWING WERE TAKEN FROM- https://github.com/mathiasbynens/dotfiles/blob/master/.vimrc
" Make Vim more useful
set nocompatible
" Use the OS clipboard by default (on versions compiled with `+clipboard`)
" THIS DOES NOT WORK FOR MY CONFIGURATION... SEE COPY PASTE MODIFICATIONS AT THE BOTTOM OF THE PAGE. 
"set clipboard=unnamed
" Enhance command-line completion
set wildmenu
" Allow cursor keys in insert mode
set esckeys
" Allow backspace in insert mode
set backspace=indent,eol,start
" Optimize for fast terminal connections
set ttyfast
" Add the g flag to search/replace by default
set gdefault
" Use UTF-8 without BOM
set encoding=utf-8 nobomb
" Change mapleader
let mapleader=","
" Always show status line
set laststatus=2
" Enable mouse in all modes
" set mouse=a
" Disable error bells
set noerrorbells
" Show the filename in the window titlebar
set title
" Show the (partial) command as it’s being typed
set showcmd
" Start scrolling three lines before the horizontal window border
set scrolloff=3


" THE FOLLOWING WERE INHERITED FROM TIM ADAMS...  
:syntax on
:set number

" Treat .json, jsx, ts, tsx files as .js
"autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript
autocmd BufNewFile,BufRead *.json set ft=javascript
autocmd BufNewFile,BufRead *.jsx set ft=javascript
autocmd BufNewFile,BufRead *.ts set ft=javascript
autocmd BufNewFile,BufRead *.tsx set ft=javascript

" Mappings for tabs & FuzzyFinder
map <C-J> :tabprevious<CR>
map <C-K> :tabnext<CR>
map <C-O> :FufFileWithCurrentBufferDir<CR>
map <C-L> :FufFile<CR>
map <C-L> :FufFile<CR>
cmap w!! w !sudo tee % >/dev/null

" Settings for tabs, indentation
set expandtab 
set tabstop=4
set shiftwidth=4
set smartindent

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
filetype on
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
  colorscheme industry
  endif

" Mappings for copy paste.  Thanks to - http://vim.wikia.com/wiki/Mac_OS_X_clipboard_sharing
nmap <C-P> :set paste<CR>:r !pbpaste<CR>:set nopaste<CR>
imap <C-P> <Esc>:set paste<CR>:r !pbpaste<CR>:set nopaste<CR>
nmap <C-C> :.w !pbcopy<CR><CR>
vmap <C-C> :w !pbcopy<CR><CR>

