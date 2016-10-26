
" Personal vimrc file.
"
" Tim Callahan
" 2016-10-08

" This shouldnt be needed but who knows depending on system wide settings
set nocompatible

" ------------------------------------------
" Enable detection of file types
filetype on
filetype plugin on
filetype indent on
syntax on

" ------------------------------------------
" Set the leader key to space
let mapleader=" "
" Short-cut to enable reloading .vimrc configuration while editing .vimrc
map <leader>s :source ~/.vimrc<CR>
" Easier navigation between splits/windows using control key
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" ------------------------------------------
" Enable pathogen plug-in manager
execute pathogen#infect()

" ------------------------------------------
" BASIC SETTINGS
" ------------------------------------------
" Enable multiple buffers to be open at a time, just hidden
set hidden

" Command history to remember
set history=100

" Number of undos supported
set undolevels=1000

" Set to always display the status line
set laststatus=2

" For some systems/terminal combinations, set these so that the backspace key can will delete properly over
" linebreaks, auto-expanded tabs, auto-indented lines, etc.
set backspace=indent,eol,start

" Turn on line numbering
set number

" Turn on show matching parenthesis
set showmatch

" Set F2 to toggle paste mode on and off.  This is for pasting from the
" clipboard
set pastetoggle=<F2>

" Dont wrap lines of text
set nowrap

" I like tabs that are 2 spaces wide
" Enable autoindent and replace tabs with spaces, etc.
set tabstop=2
set shiftwidth=2
set expandtab
set smartindent
set autoindent

" ------------------------------------------
" SEARCH SETTINGS
" ------------------------------------------
" Turn on search highlighting,
set hlsearch
" Set the return key to 'cancel' a search
nnoremap <CR> :noh<CR><CR>
" Incremental search is off by default, and since it is slow with the very large log
" files on remote hosts that I typically deal with, I leave it off by default also.
" I have it here for convenience.
"set incsearch

" Set the theme
colorscheme Tomorrow-Night-Bright

" Check when vim starts if the terminal has support for a mouse, in which case, enable it
" if has('mouse')
"   set mouse=a
" endif

" Convenience command to pretty-format a JSON file
if !exists(":FormatJSON")
  command! FormatJSON %!python -m json.tool
endif

" ------------------------------------------
" PLUGIN SETTINGS
" ------------------------------------------

" ------------------------------------------
" NERDTree
let NERDTreeShowHidden=1
let NERDTreeIgnore=['\.DS_Store', '\~$', '\.swp']
nmap <leader>n :NERDTreeToggle<CR>
nmap <leader>j :NERDTreeFind<CR>
if has('autocmd')
  autocmd VimEnter * NERDTree
  autocmd VimEnter * wincmd p
  autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
endif

" ------------------------------------------
" NERDCommenter
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
