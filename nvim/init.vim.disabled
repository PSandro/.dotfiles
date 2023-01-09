if ! filereadable(system('echo -n "$HOME/.config/nvim/autoload/plug.vim"'))
  echo "Downloading junegunn/vim-plug to manage plugins..."
  silent !mkdir -p $HOME/.config/nvim/autoload/
  silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > $HOME/.config/nvim/autoload/plug.vim
  autocmd VimEnter * PlugInstall
endif

call plug#begin("$HOME/.config/nvim/plugged")
" linting & completion
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'dense-analysis/ale'
Plug 'deoplete-plugins/jedi-vim'
Plug 'Chiel92/vim-autoformat'

" UI related
Plug 'kyoz/purify', { 'rtp': 'vim' }
Plug 'ap/vim-css-color'
Plug 'bling/vim-airline'
call plug#end()

" Some basics:
set clipboard+=unnamedplus
set expandtab
set tabstop=4
set shiftwidth=2
filetype plugin on
set encoding=utf-8
set number relativenumber
set ignorecase

" Save file as sudo on files that require root permission
cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

" colorscheme & UI
syntax on
colorscheme purify
let g:airline_theme='purify'

let g:deoplete#enable_at_startup = 1

" vim-autoformat
noremap <F3> :Autoformat<CR>
let g:formatters_js = ['eslint']
let g:autoformat_retab=0

" Ale
let g:ale_lint_on_text_changed = 'normal'
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_linters = {'python': ['flake8', 'pylint']}
let g:python3_host_prog = '/usr/bin/python3'

" split settings
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

set splitbelow
set splitright
