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


-- auto-install the following languages and enable highlights
local treesitter_languages = { "go", "lua", "nix" }
if #treesitter_languages > 0 then
  require("nvim-treesitter").install(treesitter_languages)
  for _, parser in ipairs(treesitter_languages) do
    vim.api.nvim_create_autocmd("FileType", {
      pattern = parser, -- in case that it's different for other languages I might need to modify this
      callback = function() vim.treesitter.start() end,
    })
  end
end

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

vim.opt.clipboard:append("unnamedplus")

vim.opt.listchars = {
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
vim.keymap.set('n', '<leader>o', '<cmd>vsplit<cr>', { noremap = true, silent = true })
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
vim.keymap.set('n', '<leader>f', builtin.live_grep, { noremap = true, silent = true })

-- local function diag_jump(direction)
--   vim.diagnostic.jump({
--     direction = direction,
--     diagnostic = vim.diagnostic.get(0)
--   })
-- end

-- vim.keymap.set('n', '[g', function() diag_jump("prev") end, { noremap = true, silent = true })
-- vim.keymap.set('n', ']g', function() diag_jump("next") end, { noremap = true, silent = true })

vim.diagnostic.config({ jump = { float = true } })

vim.keymap.set('n', '[g', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic', silent = true })
vim.keymap.set('n', ']g', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic', silent = true })

vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, { noremap = true, silent = true })
vim.keymap.set('n', '<leader>e', function() vim.diagnostic.setqflist() end, { noremap = true, silent = true })

vim.api.nvim_create_user_command('FormatFile', function()
  vim.lsp.buf.format({ async = true })
end, {})

vim.api.nvim_create_user_command('OrganizeImports', function()
  -- only for go
  local clients = vim.lsp.get_active_clients({ bufnr = 0 })
  for _, client in ipairs(clients) do
    if client.name == "gopls" then
      local params = vim.lsp.util.make_range_params()
      params.context = { only = { "source.organizeImports" } }
      local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params)
      for cid, res in pairs(result or {}) do
        for _, r in pairs(res.result or {}) do
          if r.edit then
            local enc = (vim.lsp.get_client_by_id(cid) or {}).offset_encoding or "utf-16"
            vim.lsp.util.apply_workspace_edit(r.edit, enc)
          end
        end
      end
      return
    end
  end
end, {})

-- Format on save if the current buffer has an attached LSP in the configured LSP servers
vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = '*',
  callback = function()
    local clients = vim.lsp.get_active_clients({ bufnr = 0 })
    for _, client in ipairs(clients) do
      if vim.tbl_contains(lspServers, client.name) then
        vim.lsp.buf.format({ async = false })
        return
      end
    end
  end,
})
