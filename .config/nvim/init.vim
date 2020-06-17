filetype plugin on

call plug#begin('~/.config/nvim/plugged')

Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'gruvbox-community/gruvbox'
Plug 'mattn/emmet-vim'
Plug 'townk/vim-autoclose'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }

call plug#end()

syntax on
set encoding=utf-8
set ignorecase smartcase hlsearch
set hidden
" Set to 2 for lightline
set laststatus=2
set listchars+=space:·
set mouse=a
set nobackup nowritebackup
set noshowmode
set number relativenumber
set tabstop=2 softtabstop=2 expandtab shiftwidth=2
set updatetime=300
set termguicolors

let g:gruvbox_italic = '1'
let g:gruvbox_contrast_dark = 'hard'
colorscheme gruvbox

" transparency issue
hi Normal ctermbg=NONE guibg=NONE

let NERDTreeMinimalUI = 1
let NERDTreeShowHidden = 1
let g:NERDTreeDirArrowExpandable = ''
let g:NERDTreeDirArrowCollapsible = ''

" Enable emmet just for html/css
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Use tab for trigger commpletion
inoremap <silent><expr> <TAB>
            \ pumvisible() ? "\<C-n>" :
            \ <SID>check_back_space() ? "\<TAB>" :
            \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

map <C-n> :NERDTreeToggle<CR>

noremap <F5> :set list!<CR>

noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
