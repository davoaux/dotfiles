filetype plugin on

call plug#begin('~/.config/nvim/plugged')

Plug 'lambdalisue/fern.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'romainl/vim-cool'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'airblade/vim-rooter'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rails'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'leafgarland/typescript-vim'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }

" colorschemes
Plug 'gruvbox-community/gruvbox'
Plug 'arzg/vim-substrata'

call plug#end()

syntax on
set encoding=utf-8
set history=50
set ignorecase
set smartcase
set hlsearch
set incsearch
set hidden
set laststatus=2
set showmode
set lcs=tab:»-,eol:↲,precedes:«,space:·
set mouse=a
set number
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
set scrolloff=5
set signcolumn=no
set termguicolors
set clipboard+=unnamedplus
set colorcolumn=
set inccommand=nosplit

exe "nohlsearch"

let mapleader = " "

" netrw
let g:netrw_banner = 0
let g:netrw_dirhistmax = 0
let g:netrw_liststyle = 0

autocmd! filetype c,cpp                 set shiftwidth=4 softtabstop=4 tabstop=4
autocmd! filetype markdown,text         set nonu nornu signcolumn=no textwidth=150
autocmd! filetype json                  set filetype=jsonc
autocmd! filetype zsh                   set filetype=sh
autocmd! bufnewfile,bufread *.jbuilder  set filetype=ruby
autocmd! bufnewfile,bufread *.tsx       set filetype=typescript.tsx " TEMP

colorscheme substrata

" https://github.com/junegunn/dotfiles/blob/master/vimrc
function! s:statusline_expr()
  let mod = "%{&modified ? '[+] ' : !&modifiable ? '[x] ' : ''}"
  let ro  = "%{&readonly ? '[RO] ' : ''}"
  let ft  = "%{len(&filetype) ? &filetype.' ' : ''}"
  let fug = "%{exists('g:loaded_fugitive') ? fugitive#statusline() : ''}"
  let sep = ' %= '
  let pos = ' %-5(%l:%c%V%) '
  let pct = ' %p '

  return ' %F %<'.mod.ro.fug.sep.ft.pos.'%*'.pct
endfunction
let &statusline = s:statusline_expr()

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

command! WQ wq
command! Wq wq
command! W w
command! Q q

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

nnoremap <leader>t m`^i- [ ] <esc>``5l

nmap <C-j> <C-w><C-j>
nmap <C-k> <C-w><C-k>
nmap <C-l> <C-w><C-l>
nmap <C-h> <C-w><C-h>

map <Up> <Nop>
map <Down> <Nop>
map <Left> <Nop>
map <Right> <Nop>
