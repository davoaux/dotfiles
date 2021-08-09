local tree_cb = require'nvim-tree.config'.nvim_tree_callback

vim.g.nvim_tree_ignore = {'.git', 'node_modules'}
vim.g.nvim_tree_gitignore = 1
vim.g.nvim_tree_auto_close = 1
vim.g.nvim_tree_quit_on_open = 1
vim.g.nvim_tree_hide_dotfiles = 1
vim.g.nvim_tree_git_hl = 0
vim.g.nvim_tree_bindings = {
  { key = 'h', cb = tree_cb('close_node') },
  { key = 'l', cb = tree_cb('edit') },
  { key = '<cr>', cb = tree_cb('cd') },
  { key = '!', cb = tree_cb('toggle_dotfiles') },
  { key = '<bs>', cb = tree_cb('dir_up') }
}

local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap('n', '<leader>n', '<cmd>NvimTreeFindFile<cr>', opts)
vim.api.nvim_set_keymap('n', '<c-n>', '<cmd>NvimTreeToggle<cr>', opts)
