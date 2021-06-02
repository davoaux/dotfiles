local tree_cb = require'nvim-tree.config'.nvim_tree_callback

vim.g.nvim_tree_ignore = {'.git', 'node_modules'}
vim.g.nvim_tree_gitignore = 1
vim.g.nvim_tree_auto_close = 1
vim.g.nvim_tree_quit_on_open = 1
vim.g.nvim_tree_hide_dotfiles = 1
vim.g.nvim_tree_bindings = {
  ["l"]       = tree_cb("edit"),
  ["<CR>"]    = tree_cb("cd"),
  ["h"]       = tree_cb("close_node"),
  ["!"]       = tree_cb("toggle_dotfiles"),
  ["<BS>"]    = tree_cb("dir_up"),
}

local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap('n', '<leader>n', '<cmd>NvimTreeFindFile<cr>', opts)
vim.api.nvim_set_keymap('n', '<c-n>', '<cmd>NvimTreeToggle<cr>', opts)
