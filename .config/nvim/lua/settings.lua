local o, wo, bo, g = vim.o, vim.wo, vim.bo, vim.g

g.netrw_banner = 0
g.netrw_dirhistmax = 0
g.netrw_nogx = 1

g.loaded_node_provider = 0
g.loaded_ruby_provider = 0
g.loaded_perl_provider = 0

o.history = 100
o.ignorecase = true
o.smartcase = true
o.hlsearch = true
o.incsearch = true
o.hidden = true
o.laststatus = 2
o.showmode = true
o.lcs = 'tab:»-,eol:↲,precedes:«,space:·'
o.mouse = 'a'
o.backup = false
o.writebackup = false
o.updatetime = 200
o.splitbelow = true
o.splitright = true
o.termguicolors = true
o.clipboard = 'unnamedplus'
o.inccommand = 'nosplit'
o.completeopt = 'menuone,noselect'
o.shortmess = o.shortmess .. 'c'

wo.number = true
wo.wrap = false
wo.cul = false
wo.scrolloff = 5
wo.signcolumn = 'yes'
wo.colorcolumn = ''

o.shiftwidth = 2
o.softtabstop = 2
o.tabstop = 2
o.expandtab = true

bo.shiftwidth = 2
bo.softtabstop = 2
bo.tabstop = 2
bo.expandtab = true

-- colorscheme
g.background = 'light'
vim.cmd [[colorscheme rams]]
