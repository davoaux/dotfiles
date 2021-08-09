local map, actions = vim.api.nvim_set_keymap, require 'telescope.actions'

local default_pickers_settings = {
  previewer = false,
  prompt_title = false,
  theme = 'dropdown',
}

require('telescope').setup {
  defaults = {
    prompt_prefix = ' ',
    file_ignore_patterns = { 'node_modules' },
    mappings = {
      i = { ['<esc>'] = actions.close }
    },
  },
  pickers = {
    buffers = default_pickers_settings,
    find_files = default_pickers_settings,
  }
}

map('n', '<c-p>', '<cmd>Telescope find_files<cr>', { noremap = true, silent = true })
map('n', '<c-b>', '<cmd>Telescope buffers<cr>', { noremap = true, silent = true })
map('n', '<c-f>', '<cmd>Telescope grep_string<cr>', { noremap = true, silent = true })
