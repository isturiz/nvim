vim.opt.tabstop = 2
vim.opt.expandtab = true
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2

--vim.opt.smartindent = true
--

-- show numbers on the side
vim.opt.nu = true
-- relative number on the side
vim.opt.relativenumber = true

-- don't wrap the line
vim.opt.wrap = false

-- improve colors
vim.opt.termguicolors = true

--vim.opt.expandtab = true

-- clipboard
vim.opt.clipboard:append("unnamedplus") -- use system clipboard as default register
--vim.keymap.set("x", "<leader>p", [["_dP]])

-- preguntar por esta
vim.opt.updatetime = 50

vim.opt.swapfile = false
vim.opt.backup = false
