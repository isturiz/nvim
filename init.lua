require "itz.settings"
require "itz.keymaps"
require "itz.lazy"
--Lazy--
vim.api.nvim_create_autocmd("User", {
  pattern = "VeryLazy",
  callback = function()
    require "itz.autocmds"
  end,
})
