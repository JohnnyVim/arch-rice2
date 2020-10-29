"===============================================================
" default options
"===============================================================
set nocompatible

set backspace=indent,eol,start
set display=truncate
set history=200
set incsearch
set nrformats-=octal
set ruler
set scrolloff=5
set showcmd
set ttimeout
set ttimeoutlen=100
set wildmenu

augroup vimStartup
  au!
  autocmd BufReadPost *
    \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
    \ |   exe "normal! g`\""
    \ | endif
augroup END

command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
                \ | wincmd p | diffthis

set nolangremap

"===============================================================
" plugin installation
"===============================================================

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'NLKNguyen/papercolor-theme'
Plug 'dense-analysis/ale'
Plug 'fatih/vim-go', { 'tag': '*' }
call plug#end()

"===============================================================
" dense-analysis/ale
"===============================================================

let g:deoplete#enable_at_startup = 1
let g:ale_linters = {
\ 'go': ['gopls'],
\}

let g:ale_fixers = {
\ '*': ['remove_trailing_lines', 'trim_whitespace'],
\ 'go': ['gofmt', 'goimports'],
\ 'sh': ['shfmt'],
\}

let g:ale_sh_shfmt_options = "-i 2"

let g:ale_completion_enabled = 1

"===============================================================
" NLKNguyen/papercolor-theme
"===============================================================

set background=dark
colorscheme PaperColor

let g:PaperColor_Theme_Options = {
\ 'theme': {
\   'default.dark': {
\     'override' : {
\       'color00' : ['', '0'],
\       'linenumber_bg' : ['', '0']
\     }
\   }
\ }
\}


"===============================================================
" custom options
"===============================================================

set number

set ignorecase
set smartcase

syntax enable
filetype plugin on

"===============================================================
" keybindings
"===============================================================

nnoremap Q :ALEFix<CR>
