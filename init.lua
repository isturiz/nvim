require "merlo.settings"
require "merlo.keymaps"
require "merlo.lazy"
--Lazy--
vim.api.nvim_create_autocmd("User", {
  pattern = "VeryLazy",
  callback = function()
    require "merlo.autocmds"
  end,
})
