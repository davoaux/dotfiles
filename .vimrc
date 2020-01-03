runtime! archlinux.vim

" Disables arrows in normal mode
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

set number
set laststatus=2

" Plugins will be downloaded  under the specified directory
call plug#begin('~/.vim/plugged')

" Declare the list of plugins.
Plug 'tpope/vim-surround'	" Quoting/parenthesizing 
Plug 'scrooloose/nerdtree'	" Tree explorer
Plug 'mattn/emmet-vim'		" Html tools
Plug 'itchyny/lightline.vim'	" Status line
Plug 'tpope/vim-eunuch' 	" Helpers for UNIX
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" List ends here. Plugins become visible to Vim after this call
call plug#end()

" Maps Ctrl+n to open NERDTree
map <C-n> :NERDTreeToggle<CR>

" lightline.vim color scheme
let g:lightline = {
	\ 'colorscheme': 'Tomorrow_Night',
	\ }

" EMMET trigger key
" (type command then ',' x2) 
let g:user_emmet_leader_key=','
