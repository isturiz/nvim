local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require(lazy).setup({

	-- lua functions that many plugins use
	"nvim-lua/plenary.nvim",
	"bluz71/vim-nightfly-guicolors", -- preferred colorscheme
	"christoomey/vim-tmux-navigator", -- tmux & split window navigation
	"szw/vim-maximizer", -- maximizes and restores current window

	-- essential plugins
	"tpope/vim-surround", -- add, delete, change surroundings (it's awesome)("inkarkat/vim-ReplaceWithRegister") -- replace with register contents using motion (gr + motion)		-- commenting with gc
	"numToStr/Comment.nvim",
	-- file explorer
	"nvim-tree/nvim-tree.lua", -- vs-code like icons
	"nvim-tree/nvim-web-devicons",
	"nvim-lualine/lualine.nvim",
	{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" }, -- dependency for better sorting performance
	{ "nvim-telescope/telescope.nvim", branch = "0.1.x" }, -- fuzzy finder
	"hrsh7th/nvim-cmp", -- completion plugin("hrsh7th/cmp-buffer") -- source for text in buffer
	"hrsh7th/cmp-path", -- source for file system paths
	"L3MON4D3/LuaSnip", -- snippet engine
	"saadparwaiz1/cmp_luasnip", -- for autocompletion
	"rafamadriz/friendly-snippets", -- useful snippets
	"williamboman/mason.nvim", -- in charge of managing lsp servers, linters & formatters
	"williamboman/mason-lspconfig.nvim", -- bridges gap b/w mason & lspconfig
	"neovim/nvim-lspconfig", -- easily configure language servers
	"hrsh7th/cmp-nvim-lsp", -- for autocompletion
	{
		"glepnir/lspsaga.nvim",
		branch = "main",
		dependencies = {
			{ "nvim-tree/nvim-web-devicons" },
			{
				"nvim-treesitter/nvim-treesitter",
				dependencies = "windwp/nvim-ts-autotag",
			},
		},
	}, -- enhanced lsp uis
	"onsails/lspkind.nvim", -- vs-code like icons for autocompletion
	"jose-elias-alvarez/null-ls.nvim", -- configure formatters & linters
	"jayp0521/mason-null-ls.nvim", -- bridges gap b/w mason & null-ls
	{
		"nvim-treesitter/nvim-treesitter",
		build = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
	},
	"windwp/nvim-autopairs", -- autoclose parens, brackets, quotes, etc...
	"lewis6991/gitsigns.nvim", -- show line modifications on left hand side
	"dart-lang/dart-vim-plugin",
	"thosakwe/vim-flutter",
	{
		"akinsho/flutter-tools.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"stevearc/dressing.nvim", -- optional for vim.ui.select
		},
	},
	"lukas-reineke/indent-blankline.nvim",
})
