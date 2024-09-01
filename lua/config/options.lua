vim.opt.tabstop = 2 -- Set the number of spaces that a tab character counts for

vim.opt.expandtab = true -- Convert tabs to spaces

vim.opt.softtabstop = 2 -- Number of spaces that a tab counts for in insert mode

vim.opt.shiftwidth = 2 -- Indentation width when using autoindent or similar

vim.opt.nu = true -- Enable line numbers

vim.opt.relativenumber = true -- Enable relative line numbers

vim.opt.wrap = false -- Disable line wrapping

vim.opt.termguicolors = true -- Enable 24-bit RGB colors in the terminal

vim.opt.clipboard:append("unnamedplus") -- Use system clipboard as the default register

vim.opt.updatetime = 50 -- Time in milliseconds to trigger the CursorHold event

vim.opt.swapfile = false -- Disable swap file creation

vim.opt.backup = false -- Disable backup file creation

vim.g.netrw_liststyle = 3 -- Set netrw view to detailed list mode

vim.g.netrw_keepdir = 1 -- Keep the cursor on the last file opened when returning to netrw

