filetype plugin on

call plug#begin('~/.config/nvim/plugged')

Plug 'ryanoasis/vim-devicons'
Plug 'gruvbox-community/gruvbox'
Plug 'altercation/vim-colors-solarized'
Plug 'townk/vim-autoclose'
Plug 'ap/vim-css-color'
Plug 'vim-airline/vim-airline'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'pangloss/vim-javascript'
Plug 'digitaltoad/vim-pug'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

call plug#end()

syntax on
set encoding=utf-8
set ignorecase smartcase hlsearch
set hidden
set laststatus=2
set noshowmode
set listchars=tab:\|\ ,space:·
set mouse=a
set number relativenumber
set cursorline
set nobackup nowritebackup
set updatetime=300
set splitbelow splitright

exec "nohlsearch"

set shiftwidth=4 softtabstop=4 tabstop=4 noexpandtab
autocmd FileType yaml setlocal shiftwidth=2 softtabstop=2 tabstop=2 expandtab 
autocmd FileType c,cpp setlocal shiftwidth=4 softtabstop=4 tabstop=4 expandtab 

" Hide fzf statusline
autocmd! FileType fzf set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler

" let g:gruvbox_italic = '1'
" let g:gruvbox_contrast_dark = 'hard'
" set termguicolors

" solarized settings
set background=light
colorscheme solarized

let g:airline_solarized_bg = 'light'
let g:airline_powerline_fonts = 1

" Style sign column to have the same color has the line number column
hi clear SignColumn
hi link SignColumn LineNr

" use terminal's bg
" hi Normal ctermbg=NONE guibg=NONE

" xclip based clipboard copy
vmap <silent> <C-c> :!xclip -f -sel clip<CR>

map <silent> <C-n> :CocCommand explorer<CR>
map <silent> <C-p> :Files<CR>

noremap <silent> <F5> :set list!<CR>
noremap <silent> <F6> :set nu! \| set rnu! \| set cul!<CR>
noremap <silent> <Space> :nohlsearch<CR>

nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-l> <C-w><C-l>
nnoremap <C-h> <C-w><C-h>

inoremap <C-k> <Up>
inoremap <C-j> <Down>
inoremap <C-h> <Left>
inoremap <C-l> <Right>

noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

cmap W w
cmap WQ wq
cmap wQ wq
cmap Q q
