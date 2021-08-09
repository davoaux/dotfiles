local opts = require 'utils'.opts

vim.api.nvim_set_keymap('n', 'gx',  '<Plug>(openbrowser-smart-search)', opts)
vim.api.nvim_set_keymap('v', 'gx',  '<Plug>(openbrowser-smart-search)', opts)
