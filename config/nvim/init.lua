local bootstrap = require("bootstrap").bootstrap_paq

-- Most of my plugins are currently handled through nix, once I've migrated all of them
-- to Nix I need to clean up paq-nvim and the bootstrap mechanism
bootstrap {
  "savq/paq-nvim",

  {
    'saghen/blink.cmp',
    branch = "v1.10.1",
    build = "nix run .#build-plugin"
  },

  "sschleemilch/slimline.nvim",
}

require 'lsp'

require 'telescope'.setup {
  defaults = require 'telescope.themes'.get_ivy()
}

require 'blink.cmp'.setup {
  keymap = { preset = "enter" },
  fuzzy = { implementation = "rust" },
  accept = { auto_brackets = { enabled = true }, },
}

require("slimline").setup {
  style = "fg",
  spaces = {
    components = '',
    left = '',
    right = ''
  }
}

vim.g.mapleader     = ' '
vim.g.health        = { style = 'float' }

vim.o.ignorecase    = true
vim.o.smartcase     = true
vim.o.hlsearch      = true

-- show the results of :sub immediately
vim.o.inccommand    = 'nosplit'

-- max number of items to show in the completion menu
vim.o.pumheight     = 10

vim.o.softtabstop   = 2
vim.o.shiftwidth    = 2
vim.o.tabstop       = 2
vim.o.expandtab     = true

vim.o.backup        = false
vim.o.writebackup   = false
vim.o.swapfile      = false

vim.o.cursorline    = false
vim.o.encoding      = 'utf-8'
vim.o.hidden        = true
vim.o.history       = 100
vim.o.mouse         = 'a'
vim.o.scrolloff     = 5
vim.o.showmode      = true
vim.o.splitbelow    = true
vim.o.splitright    = true
vim.o.wrap          = false

vim.o.background    = 'dark'
vim.o.laststatus    = 2
vim.o.number        = true
vim.o.signcolumn    = 'no'
vim.o.termguicolors = true

vim.opt.clipboard:append("unnamedplus")

vim.opt.listchars = {
  tab = "»-",
  eol = "↲",
  precedes = "«",
  space = "·"
}

vim.keymap.set('n', 'H', '^')
vim.keymap.set('n', 'L', '$')

vim.keymap.set('n', '<c-j>', ':m +1<cr>')
vim.keymap.set('n', '<c-k>', ':m -2<cr>')

vim.keymap.set('n', '<leader>i', '<cmd>split<cr>')
vim.keymap.set('n', '<leader>o', '<cmd>vsplit<cr>')
vim.keymap.set('n', '<leader>q', '<cmd>bdelete<cr>')

vim.keymap.set('n', '<f5>', '<cmd>set list!<cr>')

vim.keymap.set('n', '<up>', '<nop>')
vim.keymap.set('n', '<down>', '<nop>')
vim.keymap.set('n', '<left>', '<nop>')
vim.keymap.set('n', '<right>', '<nop>')

vim.keymap.set('n', '<c-n>', '<cmd>Neotree toggle<cr>')

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<c-b>', builtin.buffers)
vim.keymap.set('n', '<c-p>', builtin.find_files)
vim.keymap.set('n', '<c-s-f>', builtin.live_grep)
vim.keymap.set('n', '<leader>d', builtin.diagnostics)

vim.api.nvim_create_user_command('Branches', builtin.git_branches, {})
