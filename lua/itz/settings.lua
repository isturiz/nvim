-----------------------------------------------------------
-- Itz Nvim settings
-----------------------------------------------------------
vim.g.mapleader = ' '             -- change leader to space
-- Default indent
local indent = 2

-----------------------------------------------------------
-- Neovim UI
-----------------------------------------------------------
vim.opt.clipboard = 'unnamedplus' -- copy/paste to system clipboard
--vim.opt.breakindent = true      --
vim.opt.colorcolumn = '120'        -- line lenght marker at 80 columns
vim.opt.conceallevel = 0
vim.opt.confirm = true            -- confirm before exiting
vim.opt.cursorline = true
vim.opt.expandtab = true      -- use spaces instead of tabs
vim.opt.foldmethod = 'marker'     -- enable folding (default 'foldmarker')
vim.opt.hidden = true             -- enable background buffers
vim.opt.history = 100             -- remember n lines in history
vim.opt.ignorecase = true         -- ignore case in search patterns
vim.opt.inccommand = "nosplit"    -- show substitution in real time
vim.opt.joinspaces = false        -- no double spaces with join after a dot
-- vim.opt.lazyredraw = true         -- faster scrolling
vim.opt.linebreak = true          -- wrap on word boundary
vim.opt.list = true               -- Show some invisible characters
vim.opt.mouse = 'a'               -- enable mouse support
vim.opt.number = true             -- show line number
vim.opt.pumblend = 10             -- popup menu transparency
vim.opt.pumheight = 10            -- max number of items in popup menu
vim.opt.relativenumber = true     -- show line number
vim.opt.termguicolors = true      -- true color support
vim.opt.scrolloff = 8             -- lines of context
vim.opt.scrollback = 10000        -- max scrollback lines
vim.opt.shiftround = true         -- round indent
vim.opt.shiftwidth = indent       -- size of an indent
vim.opt.sidescrolloff = 8         -- columns of context
vim.opt.smartcase = true          -- ignore lowercase for the whole pattern
vim.opt.smartindent = true        -- autoindent new lines
vim.opt.splitbelow = true         -- horizontal split to the bottom
vim.opt.splitright = true         -- vertical split to the right
vim.opt.showmatch = true          -- highlight matching parenthesis
vim.opt.swapfile = false          -- don't use swapfile
vim.opt.synmaxcol = 1000          -- max column for syntax highlight
vim.opt.tabstop = indent          -- 1 tab == 2 spaces
vim.opt.undofile = true           -- enable undo
vim.opt.updatetime = 300          -- faster completion
vim.opt.wrap = true              -- display lines as one long line
vim.opt.wildmode = 'longest:full,full' -- Command-line completion mode
--vim.opt.signcolumn = 'yes:2'     -- to create two columns in left to use gitsigns and lsp diagnostic icons
vim.opt.undodir = os.getenv("HOME") .. "/.cache/nvim/undodir"

vim.opt.list = true
vim.opt.listchars = 'tab:▸ ,space:·,nbsp:␣,trail:•,precedes:«,extends:»,eol:↴'


vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

vim.o.guifont = "Hack Nerd Font Mono:h16:i"
