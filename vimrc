
" Personal vimrc file.
"
" Tim Callahan
" 2016-10-08

" This shouldnt be needed but who knows depending on system wide settings
set nocompatible

" Enable pathogen plug-in manager
execute pathogen#infect()

" Command history to remember
set history=100

" Dont wrap lines of text
set nowrap

" Turn on the row,col display, at the bottom right of the terminal
set ruler

" Show the command that is currently being typed, at the bottom right of the terminal
set showcmd

" Turn on line numbering
set number

" I like tabs that are 2 spaces wide
" Enable autoindent and replace tabs with spaces, etc.
set tabstop=2
set shiftwidth=2
set expandtab
set smartindent
set autoindent

if &t_Co > 2 || has("gui_running")
  " Turn on search highlighting,
  set hlsearch
  " Set the return key to 'cancel' a search
  nnoremap <CR> :noh<CR><CR>
  " Incremental search is off by default, and since it is slow with the very large log
  " files on remote hosts that I typically deal with, I leave it off by default also.
  " I have it here for convenience.
  "set incsearch
  " Turn on filetype syntax coloring. syntax on will also do filetype on
  syntax on
  colorscheme Tomorrow-Night-Bright
endif

" Turn on show matching parenthesis
set showmatch

" For some systems/terminal combinations, set these so that the backspace key can will delete properly over
" linebreaks, auto-expanded tabs, auto-indented lines, etc.
set backspace=indent,eol,start

" Check when vim starts if the terminal has support for a mouse, in which case, enable it
if has('mouse')
  set mouse=a
endif

" Convenience command to pretty-format a JSON file
if !exists(":FormatJSON")
  command! FormatJSON %!python -m json.tool
endif
