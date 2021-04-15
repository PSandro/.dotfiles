if ! filereadable(system('echo -n "$HOME/.config/nvim/autoload/plug.vim"'))
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !mkdir -p $HOME/.config/nvim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > $HOME/.config/nvim/autoload/plug.vim
	autocmd VimEnter * PlugInstall
endif

call plug#begin("$HOME/.config/nvim/plugged")
Plug 'preservim/nerdtree'
Plug 'bling/vim-airline'
Plug 'tpope/vim-commentary'
Plug 'ap/vim-css-color'
Plug 'godlygeek/tabular'
Plug 'davidhalter/jedi-vim'
Plug 'plasticboy/vim-markdown'
" UI related
Plug 'kyoz/purify', { 'rtp': 'vim' }
" Formater
Plug 'Chiel92/vim-autoformat'

" syntax check
Plug 'w0rp/ale'
call plug#end()

set clipboard+=unnamedplus

" Some basics:
set expandtab
set tabstop=4
set shiftwidth=2

set nocompatible
filetype plugin on
syntax on
set encoding=utf-8
set number relativenumber
let g:vim_markdown_folding_disabled = 1 " Disable folding for markdown
set ignorecase

" Save file as sudo on files that require root permission
cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

colorscheme purify
syntax on

" vim-autoformat
noremap <F3> :Autoformat<CR>
let g:formatters_js = ['eslint']
let g:autoformat_retab=0
let g:autoformat_verbosemode=1

let g:airline_theme='purify'

" Ale
" let g:ale_lint_on_enter = 0
" let g:ale_lint_on_text_changed = 'never'
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_linters = {'python': ['flake8']}


" split settings
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

set splitbelow
set splitright
