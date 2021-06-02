local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap('n', '<c-p>', '<cmd>Telescope find_files<cr>', opts)
vim.api.nvim_set_keymap('n', '<c-b>', '<cmd>Telescope buffers<cr>', opts)
