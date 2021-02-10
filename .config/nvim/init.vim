filetype plugin on

call plug#begin('~/.config/nvim/plugged')

Plug 'lambdalisue/fern.vim'
Plug 'pbrisbin/vim-colors-off'
Plug 'jiangmiao/auto-pairs'
Plug 'romainl/vim-cool'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'airblade/vim-rooter'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
" Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }

call plug#end()

syntax on
set encoding=utf-8
set history=50
set ignorecase
set smartcase
set hlsearch
set incsearch
set hidden
set laststatus=0
set showmode
set lcs=tab:»-,eol:↲,precedes:«,space:·
set mouse=a
set nonumber
set nowrap
set nocul
set nobackup
set nowritebackup
set updatetime=200
set splitbelow
set splitright
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab
set scrolloff=10
set signcolumn=yes
set termguicolors
set clipboard+=unnamedplus
set colorcolumn=
set inccommand=nosplit

exe "nohlsearch"

let mapleader = " "
let g:netrw_banner = 0
let g:netrw_dirhistmax = 0
let g:netrw_liststyle = 0

autocmd! FileType c,cpp            set shiftwidth=4 softtabstop=4 tabstop=4
autocmd! FileType markdown,text    set nonu nornu signcolumn=no textwidth=150
autocmd! FileType json             set filetype=jsonc
autocmd! FileType zsh              set filetype=sh
autocmd! bufnewfile,bufread *.tsx  set filetype=typescript.tsx " TEMP

set background=dark
colorscheme off

function! ToggleColorColumn()
    if &colorcolumn == ''
        set colorcolumn=80
    else
        set colorcolumn=
    endif
endfun

function! FilesEnhanced()
  if !empty(glob("./.git"))
    call fzf#run(fzf#wrap({'source': 'git ls-files --exclude-standard --others
          \ --cached'}))
  else
    :Files
  endif
endfun

command! Vimrc :e $MYVIMRC
command! Stack :e $HOME/workspace/STACK.md

map <silent> <leader>n :Fern %:h -drawer -toggle<CR>
map <silent> <leader>c :ColorizerToggle<CR>
map <silent> <leader>r :source $MYVIMRC<CR>

map <silent> <C-n> :Fern . -drawer -toggle<CR>
map <silent> <C-f> :CocFix<CR>
map <silent> <C-p> :call FilesEnhanced()<CR>
map <silent> <C-b> :Buffers<CR>
map <silent> <C-q> :bdelete<CR>

map <silent> <F5> :set list!<CR>
map <silent> <F6> :set nu! \| set rnu! \| set cul!<CR>
map <silent> <F7> :call ToggleColorColumn()<CR>

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

" https://github.com/junegunn/dotfiles/blob/master/vimrc
function! s:statusline_expr()
  let mod = "%{&modified ? '[+] ' : !&modifiable ? '[x] ' : ''}"
  let ro  = "%{&readonly ? '[RO] ' : ''}"
  let ft  = "%{len(&filetype) ? &filetype.' ' : ''}"
  let fug = "%{exists('g:loaded_fugitive') ? fugitive#statusline() : ''}"
  let sep = ' %= '
  let pos = ' %-8(%l:%c%)'
  return '%f %<'.mod.ro.sep.fug.ft.'%*'.pos
endfunction
let &statusline = s:statusline_expr()
