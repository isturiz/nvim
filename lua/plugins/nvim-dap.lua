return {
	"mfussenegger/nvim-dap",
	lazy = true,
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	keys = {
		{
			"<leader>db",
			function()
				require("dap").toggle_breakpoint()
			end,
			desc = "Toggle Breakpoint",
		},
		{
			"<leader>dc",
			function()
				require("dap").continue()
			end,
			desc = "Continue",
		},
		{
			"<leader>dC",
			function()
				require("dap").run_to_cursor()
			end,
			desc = "Run to Cursor",
		},
		{
			"<leader>dT",
			function()
				require("dap").terminate()
			end,
			desc = "Terminate",
		},
		{
			"<leader>da",
			function()
				require("dap").run(require("dap").configurations.python[1])
			end,
			desc = "Dap Attach Odoo",
		},
	},
	config = function()
		local dap = require("dap")
		local function get_odoo_root()
			local compose_file = vim.fn.findfile("compose.yaml", ".;")
			if compose_file == "" then
				compose_file = vim.fn.findfile("docker-compose.yaml", ".;")
			end

			if compose_file ~= "" then
				return vim.fn.fnamemodify(compose_file, ":p:h")
			else
				return vim.fn.getcwd()
			end
		end

		-- Adaptador Remoto (Overwrite)
		dap.adapters.python = {
			type = "server",
			host = "127.0.0.1",
			port = 5678,
		}

		-- Configuración de Attach
		dap.configurations.python = {
			{
				type = "python",
				request = "attach",
				name = "Odoo Devcontainer (Attach)",
				connect = {
					host = "127.0.0.1",
					port = 5678,
				},
				pathMappings = {
					{
						localRoot = get_odoo_root() .. "/src",
						remoteRoot = "/mnt/extra-addons",
					},
				},
			},
		}

		require("dapui").setup()
	end,
}
