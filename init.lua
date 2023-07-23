-- plugin required before all
require("isturiz.plugins-setup")

-- core
require("isturiz.core.options")
require("isturiz.core.keymaps")
require("isturiz.core.colorscheme")

-- plugins
require("isturiz.plugins.comment")
require("isturiz.plugins.nvim-tree")
require("isturiz.plugins.lualine")
require("isturiz.plugins.telescope")
require("isturiz.plugins.nvim-cmp")
require("isturiz.plugins.autopairs")
require("isturiz.plugins.treesitter")
require("isturiz.plugins.gitsigns")
require("isturiz.plugins.indent-blackline")

-- lsp
require("isturiz.plugins.lsp.mason")
require("isturiz.plugins.lsp.lspconfig")
require("isturiz.plugins.lsp.lspsaga")
require("isturiz.plugins.lsp.null-ls")
