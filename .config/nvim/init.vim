filetype plugin on

call plug#begin('~/.config/nvim/plugged')

Plug 'lambdalisue/fern.vim'
Plug 'lambdalisue/nerdfont.vim'
Plug 'lambdalisue/fern-renderer-nerdfont.vim'
Plug 'lambdalisue/glyph-palette.vim'
Plug 'gruvbox-community/gruvbox'
Plug 'jiangmiao/auto-pairs'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'airblade/vim-rooter'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'neoclide/jsonc.vim'
Plug 'dag/vim-fish'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }

call plug#end()

let mapleader = ","

syntax on
set encoding=utf-8
set history=50
set ignorecase smartcase hlsearch
set incsearch
set hidden
set laststatus=2
set showmode
set listchars=tab:»-,eol:↲,precedes:«,space:.
set mouse=a
set nu rnu
set nowrap
set nocursorline
set nobackup nowritebackup
set updatetime=200
set splitbelow splitright
set shiftwidth=2 softtabstop=2 tabstop=2 expandtab
set termguicolors
set clipboard+=unnamedplus
set colorcolumn=
set inccommand=nosplit

exec "nohlsearch"

autocmd FileType json set filetype=jsonc
autocmd FileType c,cpp setlocal shiftwidth=4 softtabstop=4 tabstop=4
autocmd FileType zsh set filetype=sh
autocmd bufnewfile,bufread *.tsx set filetype=typescript.tsx " TEMP

let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_contrast_light = 'medium'
let g:gruvbox_bold = 1
let g:gruvbox_italic = 1

set background=dark
colorscheme gruvbox

hi CursorLineNr ctermbg=NONE guibg=NONE
hi clear SignColumn
hi link SignColumn LineNr

" Toggle colorcolumn
function! ToogleCC()
    if &colorcolumn == ''
        set colorcolumn=80
    else
        set colorcolumn=
    endif
endfun

" Run fzf excluding ignored files by git
function! FilesEnhanced()
  call fzf#run(fzf#wrap({'source': 'git ls-files --exclude-standard --others --cached'}))
endfun

command! Vimrc :e $MYVIMRC
command! ReloadConfig :source $MYVIMRC
command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')

map <silent> <C-n> :Fern . -drawer -toggle<CR>
map <silent> <leader>n :Fern %:h -drawer -toggle<CR>
map <silent> <C-f> :CocFix<CR>
map <silent> <C-p> :call FilesEnhanced()<CR>
map <silent> <C-b> :Buffers<CR>
map <silent> <C-q> :bdelete<CR>

map <silent> <F5> :set list!<CR>
map <silent> <F6> :set nu! \| set rnu!<CR>
map <silent> <F7> :call ToogleCC()<CR>
map <silent> <Space> :nohlsearch<CR>

nmap <C-j> <C-w><C-j>
nmap <C-k> <C-w><C-k>
nmap <C-l> <C-w><C-l>
nmap <C-h> <C-w><C-h>

map <Up> <Nop>
map <Down> <Nop>
map <Left> <Nop>
map <Right> <Nop>

cmap W w
cmap WQ wq
cmap wQ wq
cmap Q q
