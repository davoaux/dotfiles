local map = vim.api.nvim_set_keymap
local wo = vim.wo

vim.g.mapleader = ' '

local opts = { noremap = true, silent = true }

map('n', '<leader>t', 'm`^i- [ ] <esc>``5l', opts)
map('n', '<leader>i', '<cmd>sp<cr>', opts)
map('n', '<leader>o', '<cmd>vsp<cr>', opts)
map('n', '<c-q>', '<cmd>bdelete<cr>', opts)
map('n', '<f5>', '<cmd>set list!<cr>', opts)
map('n', '<f6>', '<cmd>lua toggle_colorcolumn()<cr>', opts)
map('n', 'H', '^', opts)
map('n', 'L', '$', opts)
map('n', '<c-j>', '<c-w><c-j>', opts)
map('n', '<c-k>', '<c-w><c-k>', opts)
map('n', '<c-l>', '<c-w><c-l>', opts)
map('n', '<c-h>', '<c-w><c-h>', opts)
map('n', '<up>', '', opts)
map('n', '<down>', '', opts)
map('n', '<left>', '', opts)
map('n', '<right>', '', opts)

function toggle_colorcolumn()
  if wo.colorcolumn == '' then
    wo.colorcolumn = '80'
  else
    wo.colorcolumn = ''
  end
end

