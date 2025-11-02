-- ~/.config/nvim/lsp/odoo_ls.lua

local server = vim.fn.expand("$HOME/.local/share/nvim/odoo/odoo_ls_server")
local odools = "/Users/isturizdev/workspace/otros/odoocker-jr/odools.toml"

-- ficheros que definen la raíz del proyecto
local root_markers = { { "odools.toml", ".git" } }

vim.lsp.config("odoo_ls", {
  cmd = {
    server,
    "--config-path",
    odools,
  },
  filetypes = { "python", "xml" },
  root_markers = root_markers,
  settings = {
    Odoo = {
      selectedProfile = "main",
    },
  },
})

