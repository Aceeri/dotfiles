
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
set t_Co=256

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

call plug#begin("~/.vim/plugged")

Plug 'tpope/vim-sensible'

" Language plugins
Plug 'rust-lang/rust.vim'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'OrangeT/vim-csharp'
Plug 'elzr/vim-json'

Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

" (Optional) Multi-entry selection UI.
Plug 'junegunn/fzf'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" Tooling plugins
Plug 'altercation/vim-colors-solarized'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-fugitive'

if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  let g:deoplete#enable_at_startup = 1
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

call plug#end()

" appearance
syntax on
set background=dark
colorscheme solarized
set ttyfast
set t_ut=

"let g:solarized_termcolors=16
"let g:netrw_liststyle=3
"let g:rustfmt_autosave=1

" syntastic settings
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0

" nerdtree settings
autocmd vimenter * NERDTree
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '-'

" enable `ripgrep` for searching
if executable("rg")
    set grepprg=rg\ --vimgrep\ --no-heading
    set grepformat=%f:%l:%c:%m,%f:%l:%m
endif

" Required for operations modifying multiple buffers like rename.
set hidden

let g:LanguageClient_autoStart = 1
let g:LanguageClient_serverCommands = {
    \ 'rust': ['rustup', 'run', 'nightly', 'rls'],
    \ }

nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <Leader>r :call LanguageClient#textDocument_rename()<CR>
nnoremap <Leader>d :call LanguageClient#textDocument_definition()<CR>
nnoremap <Leader>f :call LanguageClient#textDocument_formatting()<CR>
nnoremap <Leader>H :call LanguageClient#textDocument_hover()<CR>

"autocmd BufWritePost * :call LanguageClient#textDocument_formatting()

com! FormatJSON %!python2 -m json.tool
