filetype plugin on

call plug#begin('~/.config/nvim/plugged')

Plug 'ryanoasis/vim-devicons'
Plug 'gruvbox-community/gruvbox'
Plug 'townk/vim-autoclose'
Plug 'ap/vim-css-color'
Plug 'vim-airline/vim-airline'
Plug 'airblade/vim-rooter'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'pangloss/vim-javascript'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'digitaltoad/vim-pug'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

call plug#end()

syntax on
set encoding=utf-8
set ignorecase smartcase hlsearch
set hidden
set laststatus=2
set noshowmode
set listchars=tab:\|\ ,space:·,eol:$
set mouse=a
set number relativenumber
set cursorline
set nobackup nowritebackup
set updatetime=100
set splitbelow splitright
set termguicolors " gruvbox's true colors
set clipboard+=unnamedplus " use system's clipboard (relies on xclip)
set colorcolumn=
set inccommand=nosplit " shows in realtime what changes the ex command should make

exec "nohlsearch"

set shiftwidth=2 softtabstop=2 tabstop=2 expandtab
autocmd FileType c,cpp setlocal shiftwidth=4 softtabstop=4 tabstop=4
autocmd FileType zsh set filetype=sh

let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_bold = 1
let g:gruvbox_italic = 1

set background=dark
colorscheme gruvbox

let g:airline_powerline_fonts = 1

hi clear SignColumn
hi link SignColumn LineNr

" Match gitgutter sign background to sign color
let g:gitgutter_set_sign_backgrounds = 1

" GitGutter signs color
highlight GitGutterAdd    guifg=#b8bb26 ctermfg=2
highlight GitGutterChange guifg=#fabd2f ctermfg=3
highlight GitGutterDelete guifg=#fb4934 ctermfg=1

" " For transparency
" hi Normal ctermbg=NONE guibg=NONE
" hi LineNr ctermbg=NONE guibg=NONE

" Function to toggle colorcolumn
function! ToogleCC()
    if &colorcolumn == ''
        set colorcolumn=80
    else
        set colorcolumn=
    endif
endfun

command! Vimrc :e $MYVIMRC

map <silent> <C-n> :CocCommand explorer<CR>
map <silent> <C-p> :Files<CR>
map <silent> <C-b> :Buffers<CR>
map <silent> <C-q> :bdelete<CR>

noremap <silent> <F5> :set list!<CR>
noremap <silent> <F6> :set nu! \| set rnu! \| set cul!<CR>
noremap <silent> <F7> :call ToogleCC()<CR>
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
