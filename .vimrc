
set nocompatible

" settings
set nu
set rnu
set backspace=indent,eol,start
set incsearch
set wildmenu
set ruler
set clipboard=unnamed
set tabstop=4
set shiftwidth=4
set expandtab
let mapleader=" "

call plug#begin("~/.vim/plugged")

" Language plugins
Plug 'rust-lang/rust.vim'
Plug 'fatih/vim-go'
Plug 'OrangeT/vim-csharp'
Plug 'elzr/vim-json'

" Tooling plugins
Plug 'altercation/vim-colors-solarized'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-fugitive'
Plug 'vim-syntastic/syntastic'

call plug#end()

" appearance
syntax on
set background=dark
colorscheme solarized

let g:solarized_termcolors=16
let g:netrw_liststyle=3
let g:rustfmt_autosave=1

" syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" nerdtree settings
autocmd vimenter * NERDTree
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '-'

" enable `ripgrep` for searching
if executable("rg")
    set grepprg=rg\ --vimgrep\ --no-heading
    set grepformat=%f:%l:%c:%m,%f:%l:%m
endif
