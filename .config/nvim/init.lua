vim.cmd 'packadd paq-nvim'
local paq = require('paq-nvim').paq
paq{'savq/paq-nvim', opt = true}

paq 'jiangmiao/auto-pairs'
paq 'romainl/vim-cool'
paq 'terrortylor/nvim-comment'
paq 'airblade/vim-rooter'
paq 'norcalli/nvim-colorizer.lua'
paq 'gruvbox-community/gruvbox'
paq 'hoob3rt/lualine.nvim'
paq 'kyazdani42/nvim-web-devicons'
paq 'kyazdani42/nvim-tree.lua'
paq 'nvim-lua/popup.nvim'
paq 'nvim-lua/plenary.nvim'
paq 'nvim-telescope/telescope.nvim'
paq 'neovim/nvim-lspconfig'
paq 'hrsh7th/nvim-compe'

-- 'tpope/vim-rails'
-- 'neoclide/coc.nvim', { 'branch': 'release' }
-- 'leafgarland/typescript-vim'
-- 'MaxMEllon/vim-jsx-pretty'
-- 'prettier/vim-prettier', { 'do': 'yarn install' }

require('settings')
require('cmd')
require('mappings')
require('lsp')

require('plugins/nvim-comment')
require('plugins/colorizer')
require('plugins/lualine')
require('plugins/nvim-tree')
require('plugins/telescope')
require('plugins/nvim-compe')
