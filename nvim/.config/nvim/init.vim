let g:netrw_banner=0
let g:netrw_dirhistmax=0
let g:netrw_nogx=1

let g:loaded_node_provider=0
let g:loaded_ruby_provider=0
let g:loaded_perl_provider=0

let g:mapleader=' '

let g:vimrc = {}
let g:vimrc.pkg = {}
let g:vimrc.pkg.plugins = expand('~/.config/vim-jetpack')
let g:vimrc.pkg.jetpack = expand(g:vimrc.pkg.plugins .. '/pack/jetpack/src/vim-jetpack')
let g:vimrc.pkg.paths = {}

if !isdirectory(g:vimrc.pkg.jetpack)
  call system(printf('git clone --depth 1 https://github.com/tani/vim-jetpack %s', shellescape(g:vimrc.pkg.jetpack)))
endif

let &runtimepath = &runtimepath . ',' . g:vimrc.pkg.jetpack
let &runtimepath = &runtimepath . ',' . fnamemodify($MYVIMRC, ':p:h')

let g:jetpack#ignore_patterns = [
\   '**/.*',
\   '**/.*/**',
\   '**/*.{toml,yaml,yml}',
\   '**/t/**',
\   '**/test/**',
\   '**/doc/tags',
\   '**/Makefile*',
\   '**/Gemfile*',
\   '**/Rakefile*',
\   '**/VimFlavor*',
\   '**/README*',
\   '**/LICENSE*',
\   '**/LICENCE*',
\   '**/CONTRIBUTING*',
\   '**/CHANGELOG*',
\   '**/NEWS*',
\   '**/VERSION',
\ ]

call jetpack#begin(g:vimrc.pkg.plugins)
call jetpack#add('tani/vim-jetpack')
call jetpack#add('nvim-treesitter/nvim-treesitter', { 'do': {-> 'TSUpdate'} })
call jetpack#add('terrortylor/nvim-comment')
call jetpack#add('romainl/vim-cool')
call jetpack#add('jiangmiao/auto-pairs')
call jetpack#add('lambdalisue/fern.vim')
call jetpack#add('antoinemadec/FixCursorHold.nvim')
call jetpack#add('ellisonleao/gruvbox.nvim')
call jetpack#end()

set encoding=utf-8
set history=100
set ignorecase
set smartcase
set hlsearch
set hidden
set laststatus=2
set showmode
set lcs="tab:»-,eol:↲,precedes:«,space:·"
set mouse=a
set nobackup
set nowritebackup
set updatetime=200
set splitbelow
set splitright
set termguicolors
set background=dark
set clipboard+=unnamedplus
set inccommand=nosplit
set completeopt="menuone,noselect"
set shortmess+=c
set number
set nowrap
set nocul
set scrolloff=5
set signcolumn=no
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

let g:gruvbox_contrast_dark='hard'
try
  colorscheme gruvbox
catch /.*/
  colorscheme default
endtry

autocmd! filetype json setlocal filetype=jsonc
autocmd! filetype zsh setlocal filetype=sh
autocmd! bufnewfile,bufread *.tsx setlocal filetype=typescript.tsx
autocmd! filetype fern setlocal signcolumn=no nonu

" See: antoinemadec/FixCursorHold.nvim
let g:cursorhold_updatetime = 100

let g:fern#mark_symbol                       = '●'
let g:fern#renderer#default#collapsed_symbol = '▷ '
let g:fern#renderer#default#expanded_symbol  = '▼ '
let g:fern#renderer#default#leading          = ' '
let g:fern#renderer#default#leaf_symbol      = ' '
let g:fern#renderer#default#root_symbol      = '~ '

nnoremap H ^
nnoremap L $
nnoremap <Leader>t m`^i- [ ] <esc>``5l'
nnoremap <Leader>i <Cmd>sp<CR>
nnoremap <Leader>o <Cmd>vsp<CR>
nnoremap <C-q> <Cmd>bdelete<CR>
nnoremap <C-n> <Cmd>:Fern . -drawer -toggle<CR>
nnoremap <F5> <Cmd>set list!<CR>

nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-l> <C-w><C-l>
nnoremap <C-h> <C-w><C-h>

nnoremap <Up>     <Nop>
nnoremap <Down>   <Nop>
nnoremap <Left>   <Nop>
nnoremap <Right>  <Nop>

lua <<EOF
require('nvim_comment').setup {
  comment_empty = false,
}

require('nvim-treesitter.configs').setup {
  highlight = { enable = true },
  indent = { enable = true }
}
EOF

command! WQ wq
command! Wq wq
command! W w
command! Q q

