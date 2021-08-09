require('compe').setup({
  source = {
    path = true;
    buffer = true;
    nvim_lsp = true;
    nvim_lua = true;
  };
})

local options = { noremap = true, expr = true, silent = true }
vim.api.nvim_set_keymap("i", "<C-Space>", "compe#complete()", options)
vim.api.nvim_set_keymap("i", "<CR>", "compe#confirm('<CR>')", options)
vim.api.nvim_set_keymap("i", "<C-e>", "compe#close('<C-e>')", options)
vim.api.nvim_set_keymap("i", "<C-f>", "compe#scroll({'delta': +4})", options)
vim.api.nvim_set_keymap("i", "<C-d>", "compe#scroll({'delta': -4})", options)

options = { noremap = true, silent = true, expr = true }
vim.api.nvim_set_keymap("i", '<Tab>',   "pumvisible() ? '<C-n>' : '<Tab>'", options)
vim.api.nvim_set_keymap("i", '<S-Tab>', "pumvisible() ? '<C-p>' : '<S-Tab>'", options)

-- VSCODE LIKE TAB COMPLETION BEHAVIOUR
--
-- local t = function(str)
--   return vim.api.nvim_replace_termcodes(str, true, true, true)
-- end

-- local check_back_space = function()
--     local col = vim.fn.col('.') - 1
--     if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
--         return true
--     else
--         return false
--     end
-- end

-- -- Use (s-)tab to:
-- --- move to prev/next item in completion menuone
-- --- jump to prev/next snippet's placeholder
-- _G.tab_complete = function()
--   if vim.fn.pumvisible() == 1 then
--     return t "<C-n>"
--   elseif vim.fn.call("vsnip#available", {1}) == 1 then
--     return t "<Plug>(vsnip-expand-or-jump)"
--   elseif check_back_space() then
--     return t "<Tab>"
--   else
--     return vim.fn['compe#complete']()
--   end
-- end
-- _G.s_tab_complete = function()
--   if vim.fn.pumvisible() == 1 then
--     return t "<C-p>"
--   elseif vim.fn.call("vsnip#jumpable", {-1}) == 1 then
--     return t "<Plug>(vsnip-jump-prev)"
--   else
--     -- If <S-Tab> is not working in your terminal, change it to <C-h>
--     return t "<S-Tab>"
--   end
-- end

-- vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
-- vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
-- vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
-- vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
