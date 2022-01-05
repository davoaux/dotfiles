M = {}

-- Highlights
function M.fg(group, color)
    vim.cmd("hi " .. group .. " guifg=" .. color)
end

function M.bg(group, color)
    vim.cmd("hi " .. group .. " guibg=" .. color)
end

function M.fg_bg(group, fgcol, bgcol)
    vim.cmd("hi " .. group .. " guifg=" .. fgcol .. " guibg=" .. bgcol)
end

-- Default mapping options
M.opts = { noremap = true, silent = true }

-- Misc
function M.check_git_workspace()
  local filepath = vim.fn.expand('%:p:h')
  local gitdir = vim.fn.finddir('.git', filepath .. ';')
  return gitdir and #gitdir > 0 and #gitdir < #filepath
end

return M
