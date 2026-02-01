local M = {}

-- enable the specified language servers
vim.api.nvim_create_autocmd({ 'BufReadPre', 'BufNewFile' }, {
  once = true,
  callback = function()
    vim.lsp.enable({ "bashls", "gopls", "lua_ls", "nil_ls" })
  end
})

vim.api.nvim_create_user_command('FormatFile', function()
  vim.lsp.buf.format({ async = true })
end, { desc = "Format the current file using the attached LSP" })

-- Set up LSP completion configuration
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client == nil then
      return
    end
    vim.keymap.set('n', '<c-s-k>', function() vim.lsp.buf.code_action() end) -- default is 'gra'
    vim.keymap.set('n', '<leader>f', function() vim.lsp.buf.format({ async = true }) end)
    vim.keymap.set('n', 'grr', ':Telescope lsp_references<cr>', { silent = true })
    vim.keymap.set('n', 'gd', ':Telescope lsp_definitions<cr>', { silent = true })     -- no default
    vim.keymap.set('n', 'gi', ':Telescope lsp_implementations<cr>', { silent = true }) -- default is 'gri'
  end,
})

vim.diagnostic.config({
  virtual_text = { current_line = true },
})

-- Override Lua language server configuration for better Neovim configuration completions
vim.lsp.config('lua_ls', {
  on_init = function(client)
    client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
      runtime = {
        version = 'LuaJIT',
        path = {
          'lua/?.lua',
          'lua/?/init.lua',
        },
      },
      workspace = {
        checkThirdParty = false,
        library = { vim.env.VIMRUNTIME },
      },
    })
  end,
  settings = {
    Lua = {},
  },
})

return M
