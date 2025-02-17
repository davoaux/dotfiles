-- set updatetime=200
-- set clipboard+=unnamedplus
-- set inccommand=nosplit
-- set completeopt="menuone,noselect"
-- set shortmess+=c

local bootstrap = require("bootstrap").bootstrap_paq

-- Install packages
bootstrap {
  "savq/paq-nvim",

  "nvim-treesitter/nvim-treesitter",

  "neovim/nvim-lspconfig",
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",

  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/nvim-cmp",

  "nvim-lua/plenary.nvim",
  "nvim-telescope/telescope.nvim",

  "nvim-tree/nvim-tree.lua",
  "nvim-tree/nvim-web-devicons",

  "jiangmiao/auto-pairs",
  "romainl/vim-cool",
}

require("nvim-treesitter.configs").setup {
  ensure_installed = { "vim", "vimdoc", "go", "gomod", "lua" },
  sync_install = true,
  indent = {
    enable = true
  },
  highlight = {
    enable = true
  }
}

local lspServers = { "gopls", "lua_ls", "bashls" }

require("mason").setup()
require("mason-lspconfig").setup {
  ensure_installed = lspServers
}

local cmp = require("cmp")

cmp.setup({
  snippet = {
    expand = function(args)
      vim.snippet.expand(args.body) -- native nvim snippets
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<c-space>'] = cmp.mapping.complete(),
    ['<c-e>'] = cmp.mapping.abort(),
    ['<cr>'] = cmp.mapping.confirm({ select = true }),
  }),
  sources = cmp.config.sources({
    { name = "nvim_lsp" }
  }, {
    { name = "buffer" }
  })
})

local on_attach_lsp = function(client, bufnr)
  -- vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>',
    { noremap = true, silent = true })
  -- vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>',
    { noremap = true, silent = true })
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<c-a>', '<cmd>lua vim.lsp.buf.code_action()<CR>',
    { noremap = true, silent = true })
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>',
    { noremap = true, silent = true })
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>f', '<cmd>lua vim.lsp.buf.format { async=true }<CR>',
    { noremap = true, silent = true })
end
local capabilities = require("cmp_nvim_lsp").default_capabilities()
for _, server in ipairs(lspServers) do
  require("lspconfig")[server].setup {
    on_attach = on_attach_lsp,
    capabilities = capabilities,
  }
end

require("telescope").setup {
  pickers = {
    find_files = { theme = "ivy" },
    buffers = { theme = "ivy" },
    live_grep = { theme = "ivy" },
  }
}

require("nvim-tree").setup({
  renderer = {
    icons = {
      show = {
        file = false,
        folder = false,
        folder_arrow = false,
        git = true,
        modified = true,
        hidden = false,
        diagnostics = true,
        bookmarks = true,
      },
    }
  }
})
-- need patched font
require("nvim-web-devicons").setup()

vim.g.mapleader         = ' '
vim.g.loaded_netrw      = 1
vim.gloaded_netrwPlugin = 1

vim.o.ignorecase        = true
vim.o.smartcase         = true
vim.o.hlsearch          = true

vim.o.softtabstop       = 2
vim.o.shiftwidth        = 2
vim.o.tabstop           = 2
vim.o.expandtab         = true

vim.o.backup            = false
vim.o.writebackup       = false

vim.o.cursorline        = false
vim.o.encoding          = 'utf-8'
vim.o.hidden            = true
vim.o.history           = 100
vim.o.mouse             = 'a'
vim.o.scrolloff         = 5
vim.o.showmode          = true
vim.o.splitbelow        = true
vim.o.splitright        = true
vim.o.wrap              = false

vim.o.background        = 'dark'
vim.o.laststatus        = 2
vim.o.number            = true
vim.o.signcolumn        = 'no'
vim.o.termguicolors     = true

vim.opt.listchars       = {
  tab = "»-",
  eol = "↲",
  precedes = "«",
  space = "·"
}

vim.keymap.set('n', 'H', '^', { noremap = true, silent = true })
vim.keymap.set('n', 'L', '$', { noremap = true, silent = true })

vim.keymap.set('n', '<c-j>', ':m +1<cr>', { noremap = true, silent = true })
vim.keymap.set('n', '<c-k>', ':m -2<cr>', { noremap = true, silent = true })

vim.keymap.set('n', '<leader>i', '<cmd>split<cr>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>i', '<cmd>vsplit<cr>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>q', '<cmd>bdelete<cr>', { noremap = true, silent = true })

vim.keymap.set('n', '<f5>', '<cmd>set list!<cr>', { noremap = true, silent = true })

vim.keymap.set('n', '<up>', '<nop>', { noremap = true, silent = true })
vim.keymap.set('n', '<down>', '<nop>', { noremap = true, silent = true })
vim.keymap.set('n', '<left>', '<nop>', { noremap = true, silent = true })
vim.keymap.set('n', '<right>', '<nop>', { noremap = true, silent = true })

vim.keymap.set('n', '<c-n>', ':NvimTreeToggle<cr>', { noremap = true, silent = true })

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<c-p>', builtin.find_files, { noremap = true, silent = true })
vim.keymap.set('n', '<c-b>', builtin.buffers, { noremap = true, silent = true })
vim.keymap.set('n', '<c-f>', builtin.live_grep, { noremap = true, silent = true })

-- don't work, use ]d/[d
-- vim.keymap.set('n', '[g', 'vim.diagnostic.goto_prev', { noremap = true, silent = true })
-- vim.keymap.set('n', ']g', 'vim.diagnostic.goto_next', { noremap = true, silent = true })
