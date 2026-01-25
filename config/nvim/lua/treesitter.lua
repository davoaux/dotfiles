local M = {}

-- auto-install the following language parsers and enable them
local treesitter_languages = { "bash", "go", "lua", "nix" }
if #treesitter_languages > 0 then
  require("nvim-treesitter").install(treesitter_languages)
  for _, parser in ipairs(treesitter_languages) do
    vim.api.nvim_create_autocmd("FileType", {
      pattern = parser, -- in case that it's different for other languages I might need to modify this
      callback = function() vim.treesitter.start() end,
    })
  end
end

return M
