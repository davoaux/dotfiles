require('lualine').setup({
  options = {
    icons_enabled = true,
    theme = 'gruvbox',
    component_separators = {'', ''},
    section_separators = {'', ''},
  },
  extensions = {'nvim-tree'}
})
