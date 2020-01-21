runtime! archlinux.vim

" Plugins will be downloaded  under the specified directory
call plug#begin('~/.vim/plugged')

" Load plugins
" VIM enhancements 
Plug 'tpope/vim-surround'      " Quoting/parenthesizing
Plug 'godlygeek/tabular'       " Text filtering and alignment
Plug 'mattn/emmet-vim'         " Html tools
Plug 'tpope/vim-eunuch'        " Helpers for UNIX

" GUI enhancements
Plug 'chriskempson/base16-vim' " Color scheme
Plug 'scrooloose/nerdtree'     " Tree explorer
Plug 'itchyny/lightline.vim'   " Status line

" Markdown utils
Plug 'plasticboy/vim-markdown' " zR opens all folds
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }

" Fuzzy finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" List ends here. Plugins become visible to Vim after this call
call plug#end()

" Maps Ctrl+n to open NERDTree
map <C-n> :NERDTreeToggle<CR>

" EMMET trigger key
" type command then press ',' two times 
let g:user_emmet_leader_key=','

" Base16
let base16colorspace=256

if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif

" Colors
colorscheme base16-gruvbox-dark-hard

" Lightline
let g:lightline = {
	\ 'colorscheme': 'powerline',
	\ }

" Editor settings
set encoding=utf-8
set mouse=a        " Enable mouse usage (all modes)
set relativenumber " Show's relative line numbers
set number         " Show's current line
set laststatus=2
set signcolumn=no
syntax on
set vb t_vb=       " Disables the beep sound
set showcmd        " Shows command in status line


" Tabs
set tabstop=4     " Tab characters appear n-spaces-wide
set softtabstop=4 " def 0
set noexpandtab   " def
set shiftwidth=4  " The size of an indent

" Disables arrows in normal mode
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
