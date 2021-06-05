local colors = {
  black        = '#282828',
  white        = '#ebdbb2',
  red          = '#fb4934',
  green        = '#b8bb26',
  blue         = '#83a598',
  purple       = '#d3869b',
  yellow       = '#fe8019',
  gray         = '#a89984',
  darkgray     = '#3c3836',
  lightgray    = '#504945',
  inactivegray = '#7c6f64',
  transparent  = '#1d2021',
}

local custom_gruvbox = require'lualine.themes.gruvbox'

custom_gruvbox = {
  normal = {
    a = {bg = colors.green, fg = colors.black},
    b = {bg = colors.black, fg = colors.white, gui = 'bold'},
    c = {bg = colors.transparent, fg = colors.gray},
  },
  insert = {
    a = {bg = colors.blue, fg = colors.black},
    b = {bg = colors.black, fg = colors.white, gui = 'bold'},
    c = {bg = colors.transparent, fg = colors.gray},
  },
  visual = {
    a = {bg = colors.yellow, fg = colors.black},
    b = {bg = colors.black, fg = colors.white, gui = 'bold'},
    c = {bg = colors.transparent, fg = colors.gray},
  },
  replace = {
    a = {bg = colors.red, fg = colors.black},
    b = {bg = colors.black, fg = colors.white, gui = 'bold'},
    c = {bg = colors.transparent, fg = colors.gray},
  },
  command = {
    a = {bg = colors.purple, fg = colors.black},
    b = {bg = colors.black, fg = colors.white, gui = 'bold'},
    c = {bg = colors.transparent, fg = colors.gray},
  },
  inactive = {
    a = {bg = colors.darkgray, fg = colors.inactivegray},
  }
}

local function mode_whitespace()
  return ' '
end

local function check_git_workspace()
  local filepath = vim.fn.expand('%:p:h')
  local gitdir = vim.fn.finddir('.git', filepath .. ';')
  return gitdir and #gitdir > 0 and #gitdir < #filepath
end

local function git_icon()
  return check_git_workspace() and '' or ''
end

require('lualine').setup({
  options = {
    icons_enabled = true,
    theme = custom_gruvbox,
    component_separators = {'', ''},
    section_separators = {'', ''},
  },
  sections = {
    lualine_a = {{mode_whitespace, padding = 0}},
    lualine_b = {'mode'},
    lualine_c = {
      {git_icon, color = {fg = '#F1502F'}, left_padding = 2, right_padding = 0},
      {'branch', icon = '', padding = 0},
    },
    lualine_x = {'filename', 'filetype', 'location'},
    lualine_y = {},
    lualine_z = {},
  },
  extensions = {'nvim-tree'}
})
