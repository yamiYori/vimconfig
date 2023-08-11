"Setting above all, use nocompatible to get full experience
set nocompatible

" BASIC SETTINGS ------------ {{{
syntax on
filetype on
filetype plugin on
filetype indent on

set number
set cursorline
"hi CursorLine cterm=NONE ctermbg=gray ctermfg=NONE guibg=NONE guifg=white
"set cursorcolumn
"set shiftwidth=4
set tabstop=4
set expandtab

set showcmd
set showmode
set showmatch
set wildmenu
set wildmode=list:longest
set scrolloff=10

set history=1000
set incsearch
set hlsearch
set smartcase
" }}}

" VIMSCRIPT ----------------- {{{
augroup filetype_vim
        autocmd!
        autocmd FileType vim setlocal foldmethod=marker
augroup END

function! ToggleMouse()
    " check if mouse is enabled
    if &mouse == 'a'
        " disable mouse
        set mouse=
    else
        " enable mouse everywhere
        set mouse=a
    endif
endfunc
" }}}

" MAPPINGS --------------------------------------------------------------- {{{
" Set the backslash as the leader key.
let mapleader = '\'
" }}}

" PLUGINS ------------------- {{{
call plug#begin()
" code align
Plug 'junegunn/vim-easy-align'
" File tree explorer
Plug 'preservim/nerdtree'
" code lint engine
Plug 'dense-analysis/ale'
" F12 toggle mouse mode
Plug 'nvie/vim-togglemouse'
call plug#end()
" }}}

" PLUGINS SETTINGS ---------- {{{
" nerdtree
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<space>
" Start NERDTree when Vim starts with a directory argument.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
    \ execute 'NERDTree' argv()[0]| wincmd p | enew | execute 'cd '.argv()[0] | wincmd p | endif
" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
"autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
"    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif
" }}}
