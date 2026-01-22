local bootstrap = require("bootstrap").bootstrap_paq

-- Install packages
bootstrap {
  "savq/paq-nvim",

  { "nvim-treesitter/nvim-treesitter", branch = "main", build = ":TSUpdate" },

  "neovim/nvim-lspconfig",

  -- "hrsh7th/cmp-nvim-lsp",
  -- "hrsh7th/nvim-cmp",

  "nvim-telescope/telescope.nvim",
  "nvim-lua/plenary.nvim",

  "nvim-neo-tree/neo-tree.nvim",
  "nvim-lua/plenary.nvim",
  "MunifTanjim/nui.nvim",

  "jiangmiao/auto-pairs",
  "romainl/vim-cool",
}

-- auto-install the following languages and enable highlights
local treesitter_languages = { "bash", "go", "lua", "nix" }
if #treesitter_languages > 0 then
  require("nvim-treesitter").install(treesitter_languages)
  for _, parser in ipairs(treesitter_languages) do
    vim.api.nvim_create_autocmd("FileType", {
      pattern = parser, -- in case that it's different for other languages I might need to modify this
      callback = function() vim.treesitter.start() end,
    })
  end
end

vim.lsp.enable({ "bashls", "gopls", "lua_ls" })

-- local lspServers = { "lua_ls", "gopls" }
--
-- require("mason").setup()
-- require("mason-lspconfig").setup {
--   ensure_installed = lspServers
-- }

-- local cmp = require("cmp")

-- cmp.setup({
--   snippet = {
--     expand = function(args)
--       vim.snippet.expand(args.body) -- native nvim snippets
--     end,
--   },
--   mapping = cmp.mapping.preset.insert({
--     ['<c-space>'] = cmp.mapping.complete(),
--     ['<c-e>'] = cmp.mapping.abort(),
--     ['<cr>'] = cmp.mapping.confirm({ select = true }),
--   }),
--   sources = cmp.config.sources({
--     { name = "nvim_lsp" }
--   }, {
--     { name = "buffer" }
--   })
-- })

-- local on_attach_lsp = function(_, bufnr)
--   -- vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
--   vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>',
--     { noremap = true, silent = true })
--   vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', { noremap = true, silent = true })
--   vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>',
--     { noremap = true, silent = true })
--   vim.api.nvim_buf_set_keymap(bufnr, 'n', '<c-f>', '<cmd>lua vim.lsp.buf.code_action()<CR>',
--     { noremap = true, silent = true })
--   vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>',
--     { noremap = true, silent = true })
-- end
-- local capabilities = require("cmp_nvim_lsp").default_capabilities()
-- for _, server in ipairs(lspServers) do
--   require("lspconfig")[server].setup {
--     on_attach = on_attach_lsp,
--     capabilities = capabilities,
--   }
-- end

require("telescope").setup {
  pickers = {
    find_files = { theme = "ivy" },
    buffers = { theme = "ivy" },
    live_grep = { theme = "ivy" },
  }
}

vim.g.mapleader         = ' '
vim.g.health            = { style = 'float' }

vim.o.ignorecase        = true
vim.o.smartcase         = true
vim.o.hlsearch          = true

-- show the results of :sub immediately
vim.o.inccommand        = 'nosplit'

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

vim.api.nvim_create_user_command('Branches', builtin.git_branches, {})

-- local function diag_jump(direction)
--   vim.diagnostic.jump({
--     direction = direction,
--     diagnostic = vim.diagnostic.get(0)
--   })
-- end

-- vim.keymap.set('n', '[g', function() diag_jump("prev") end, { noremap = true, silent = true })
-- vim.keymap.set('n', ']g', function() diag_jump("next") end, { noremap = true, silent = true })

-- vim.diagnostic.config({ jump = { float = true } })

-- vim.keymap.set('n', '[g', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic', silent = true })
-- vim.keymap.set('n', ']g', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic', silent = true })

-- vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, { noremap = true, silent = true })
-- vim.keymap.set('n', '<leader>e', function() vim.diagnostic.setqflist() end, { noremap = true, silent = true })

-- vim.api.nvim_create_user_command('FormatFile', function()
--   vim.lsp.buf.format({ async = true })
-- end, {})

-- vim.api.nvim_create_user_command('OrganizeImports', function()
--   -- only for go
--   local clients = vim.lsp.get_active_clients({ bufnr = 0 })
--   for _, client in ipairs(clients) do
--     if client.name == "gopls" then
--       local params = vim.lsp.util.make_range_params()
--       params.context = { only = { "source.organizeImports" } }
--       local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params)
--       for cid, res in pairs(result or {}) do
--         for _, r in pairs(res.result or {}) do
--           if r.edit then
--             local enc = (vim.lsp.get_client_by_id(cid) or {}).offset_encoding or "utf-16"
--             vim.lsp.util.apply_workspace_edit(r.edit, enc)
--           end
--         end
--       end
--       return
--     end
--   end
-- end, {})

-- Format on save if the current buffer has an attached LSP in the configured LSP servers
-- vim.api.nvim_create_autocmd('BufWritePre', {
--   pattern = '*',
--   callback = function()
--     local clients = vim.lsp.get_active_clients({ bufnr = 0 })
--     for _, client in ipairs(clients) do
--       if vim.tbl_contains(lspServers, client.name) then
--         vim.lsp.buf.format({ async = false })
--         return
--       end
--     end
--   end,
-- })
