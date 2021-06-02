require('colorizer').setup()

local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap('n', '<leader>c', '<cmd>ColorizerToggle<cr>', opts)
