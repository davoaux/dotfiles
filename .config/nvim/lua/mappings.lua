local keymap, wo = vim.api.nvim_set_keymap, vim.wo

vim.g.mapleader = ' '

local opts = require 'utils'.opts

keymap('n', '<leader>t',  'm`^i- [ ] <esc>``5l',       opts)
keymap('n', '<leader>i',  '<cmd>sp<cr>',               opts)
keymap('n', '<leader>o',  '<cmd>vsp<cr>',              opts)
keymap('n', '<c-q>',      '<cmd>bdelete<cr>',          opts)
keymap('n', '<f5>',       '<cmd>set list!<cr>',        opts)
keymap('n', '<f6>',       '<cmd>lua toggle_cc()<cr>',  opts)
keymap('n', 'H',          '^',                         opts)
keymap('n', 'L',          '$',                         opts)
keymap('n', '<c-j>',      '<c-w><c-j>',                opts)
keymap('n', '<c-k>',      '<c-w><c-k>',                opts)
keymap('n', '<c-l>',      '<c-w><c-l>',                opts)
keymap('n', '<c-h>',      '<c-w><c-h>',                opts)
keymap('n', '<up>',       '',                          opts)
keymap('n', '<down>',     '',                          opts)
keymap('n', '<left>',     '',                          opts)
keymap('n', '<right>',    '',                          opts)

function toggle_cc()
  wo.colorcolumn = (wo.colorcolumn == '' and '80' or '')
end

