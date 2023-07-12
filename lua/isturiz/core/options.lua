local opt = vim.opt -- for consciseness

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

vim.cmd([[autocmd BufWritePre * :%s/\s\+$//e]])
-- autocmd BufWritePre * :%s/\s\+$//e
