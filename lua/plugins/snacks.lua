return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	keys = {

		-- terminal
		{
			"<leader>\\",
			function()
				require("snacks").terminal()
			end,
			desc = "Toggle a terminal",
			mode = { "n", "t" },
		},

		-- zen
		{
			"<leader>z",
			function()
				require("snacks").zen()
			end,
			desc = "Toggle Zen Mode",
		},
		{
			"<leader>Z",
			function()
				require("snacks").zen.zoom()
			end,
			desc = "Toggle Zoom",
		},

		-- scratch
		{
			"<leader>.",
			function()
				require("snacks").scratch()
			end,
			desc = "Toggle Scratch Buffer",
		},
		{
			"<leader>S",
			function()
				require("snacks").scratch.select()
			end,
			desc = "Select Scratch Buffer",
		},

		-- notifier
		{
			"<leader>nh",
			function()
				require("snacks").notifier.show_history()
			end,
			desc = "Notification History",
		},

		-- bufdelete
		{
			"<leader>bd",
			function()
				require("snacks").bufdelete()
			end,
			desc = "Delete Buffer",
		},

		-- rename
		{
			"<leader>cR",
			function()
				require("snacks").rename.rename_file()
			end,
			desc = "Rename File",
		},

		-- gitbrowse
		{
			"<leader>gcf", -- TODO: improve this map
			function()
				require("snacks").gitbrowse()
			end,
			desc = "Git Browse",
			mode = { "n", "v" },
		},

		-- git
		{
			"<leader>gb",
			function()
				require("snacks").git.blame_line()
			end,
			desc = "Git Blame Line",
		},

		-- lazygit
		{
			"<leader>lg",
			function()
				require("snacks").lazygit()
			end,
			desc = "Lazygit",
		},
		{
			"<leader>gf",
			function()
				require("snacks").lazygit.log_file()
			end,
			desc = "Lazygit Current File History",
		},
		{
			"<leader>gl",
			function()
				require("snacks").lazygit.log()
			end,
			desc = "Lazygit Log (cwd)",
		},

		-- notifier
		{
			"<leader>un",
			function()
				require("snacks").notifier.hide()
			end,
			desc = "Dismiss All Notifications",
		},

		-- picker
		{
			"<leader>pp",
			function()
				require("snacks").picker.smart({ multi = { "buffers", "files" } })
			end,
			desc = "Smart Picker",
		},
		{
			"<leader>pf",
			function()
				require("snacks").picker.files()
			end,
			desc = "Files Picker",
		},
		{
			"<leader>pe",
			function()
				require("snacks").picker.buffers()
			end,
			desc = "Buffers Picker",
		},
		{
			"<leader>pg",
			function()
				require("snacks").picker.grep()
			end,
			desc = "Grep Picker",
		},
		{
			"<leader>ph",
			function()
				require("snacks").picker.help()
			end,
			desc = "Help Picker",
		},
		{
			"<leader>ps",
			function()
				require("snacks").picker.git_status()
			end,
			desc = "Git Status Picker",
		},
		{
			"<leader>:",
			function()
				require("snacks").picker.command_history()
			end,
			desc = "Command history picker",
		},

		-- Automatically search across all immediate subdirectories of the current working directory.
		-- Useful when your top-level folder contains multiple git repos (each in its own subdir).
		{
			"<leader>pG",
			function()
				-- Gather immediate subdirectories of the current working directory.
				-- We skip some noisy directories by default (adjust the skip list if needed).
				local cwd = vim.fn.getcwd()
				local glob_results = vim.fn.glob(cwd .. "/*", 0, 1) -- returns a list
				local dirs = {}
				local skip = {
					["node_modules"] = true,
					[".git"] = true,
					["target"] = true,
					["build"] = true,
				}

				for _, p in ipairs(glob_results) do
					if vim.fn.isdirectory(p) == 1 then
						local basename = vim.fn.fnamemodify(p, ":t")
						if not skip[basename] then
							table.insert(dirs, p)
						end
					end
				end

				-- If no subdirs are found, fall back to the cwd itself.
				if #dirs == 0 then
					dirs = { cwd }
				end

				-- Open the snacks grep picker searching the collected directories.
				-- need_search = false: allow typing immediately without requiring an initial pattern
				-- live = true: enable live grep (works if ripgrep is available)
				require("snacks").picker.grep({
					dirs = dirs,
					live = true,
					need_search = true,
					show_empty = true,
				})
			end,
			desc = "Grep Picker sub-repositories ",
		},
		{
			"<leader>pF",
			function()
				local cwd = vim.fn.getcwd()
				-- Get list of entries in cwd (files and dirs)
				local entries = vim.fn.glob(cwd .. "/*", 0, 1)
				local dirs = {}
				-- Skip list for noisy dirs (adjust as needed)
				local skip = {
					["node_modules"] = true,
					[".git"] = true,
					["target"] = true,
					["build"] = true,
					["dist"] = true,
				}

				for _, p in ipairs(entries) do
					if vim.fn.isdirectory(p) == 1 then
						local name = vim.fn.fnamemodify(p, ":t")
						if not skip[name] then
							table.insert(dirs, p)
						end
					end
				end

				-- Fallback to cwd if no subdirectories found
				if #dirs == 0 then
					dirs = { cwd }
				end

				-- Open snacks files picker searching the collected directories.
				-- Use sensible defaults: show hidden = false, follow symlinks = false.
				-- Adjust opts (hidden/ignored/follow/args) as you need.
				require("snacks").picker.files({
					dirs = dirs,
					hidden = false,
					ignored = false,
					follow = false,
					show_empty = true,
				})
			end,
			desc = "Find files sub-repositories (auto-detect subdirs)",
		},
	},
	---@type snacks.Config
	opts = {
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
		bigfile = { enabled = true },
		indent = { enabled = true },
		input = { enabled = true },
		picker = require("meta-plugins.snacks.picker"),
		notifier = { enabled = true },
		quickfile = { enabled = true },
		scroll = { enabled = true },
		statuscolumn = { enabled = true },
		words = { enabled = true },
		image = {
			enabled = true,
			doc = {
				inline = false,
				float = true,
				max_width = 60,
				max_height = 30,
			},
		},
	},
}
