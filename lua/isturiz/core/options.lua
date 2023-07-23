local opt = vim.opt -- for consciseness

-- Show matchparen
opt.showmatch = true

-- line numbers
opt.relativenumber = true
opt.number = true

-- tabs & indentation
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true

-- search settings
opt.ignorecase = true
opt.smartcase = true

-- cursos line
opt.cursorline = true

-- appearance
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

-- backspace
opt.backspace = "indent,eol,start"

-- clipboard
opt.clipboard:append("unnamedplus") -- Clipboard with SO

-- split windows
opt.splitright = true
opt.splitbelow = true

opt.iskeyword:append("-") -- consider string-string as whole word

-- Save without extras spaces
vim.cmd([[autocmd BufWritePre * :%s/\s\+$//e]])
-- autocmd BufWritePre * :%s/\s\+$//e

-- Desactivate wrap line by default
vim.cmd([[
augroup DisableWrap
autocmd!
autocmd BufEnter * set nowrap
augroup END
]])

-- Save with 4 space indent
vim.cmd([[autocmd BufWritePre * :execute 'normal! mzgg=G`z']])
