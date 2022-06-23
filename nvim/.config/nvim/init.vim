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
call jetpack#add('neovim/nvim-lspconfig')
call jetpack#add('hrsh7th/nvim-cmp')
call jetpack#add('hrsh7th/cmp-nvim-lsp')
call jetpack#add('saadparwaiz1/cmp_luasnip')
call jetpack#add('L3MON4D3/LuaSnip')
call jetpack#add('nvim-lua/plenary.nvim')
call jetpack#add('nvim-telescope/telescope.nvim')
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
nnoremap <leader>t m`^i- [ ] <esc>``5l'
nnoremap <leader>i <cmd>sp<cr>
nnoremap <leader>o <cmd>vsp<cr>
nnoremap <C-q> <cmd>bdelete<cr>
nnoremap <C-n> <cmd>:Fern . -drawer -toggle<cr>
nnoremap <F5> <cmd>set list!<cr>

nnoremap <C-p> <cmd>Telescope find_files<cr>
nnoremap <C-b> <cmd>Telescope buffers<cr>

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

require('telescope').setup {
  pickers = {
    find_files = { theme = "ivy" },
    buffers    = { theme = "ivy" }
  }
}

-- LSP/completion
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

local lspconfig = require('lspconfig')

local opts = { noremap=true, silent=true }
local on_attach = function(client, bufnr)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
end

local servers = { 'gopls', 'tsserver' }
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

local luasnip = require 'luasnip'

local cmp = require 'cmp'
cmp.setup {
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end,
    ['<S-Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end,
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  },
}
EOF

command! WQ wq
command! Wq wq
command! W w
command! Q q

