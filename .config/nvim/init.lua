vim.cmd 'packadd paq-nvim'

require 'paq-nvim' {
  'savq/paq-nvim',

  -- LSP
  'neovim/nvim-lspconfig',
  'hrsh7th/nvim-compe',

  -- Tree-sitter
  {'nvim-treesitter/nvim-treesitter', run=function() vim.cmd 'TSUpdate' end},

  -- Telescope
  'nvim-lua/popup.nvim',
  'nvim-lua/plenary.nvim',
  'nvim-telescope/telescope.nvim',

  -- File explorer
  'kyazdani42/nvim-web-devicons',
  'kyazdani42/nvim-tree.lua',

  -- UI
  'Iron-E/nvim-highlite',
  -- 'glepnir/galaxyline.nvim',

  -- Misc
  'jiangmiao/auto-pairs',
  'romainl/vim-cool',
  'terrortylor/nvim-comment',
  'airblade/vim-rooter',
  'norcalli/nvim-colorizer.lua',
}

require 'settings'
require 'cmd'
require 'mappings'
require 'lsp'

require 'plugins/colorizer'
require 'plugins/nvim-comment'
require 'plugins/nvim-compe'
require 'plugins/nvim-tree'
require 'plugins/nvim-treesitter'
require 'plugins/telescope'
