return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, { "javascript", "typescript", "tsx" })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "jose-elias-alvarez/typescript.nvim",
    },
    opts = {
      servers = {
        tsserver = {},
      },
      setup = {
        tsserver = function(_, opts)
          local lsp_utils = require("plugins.lsp.utils")
          lsp_utils.on_attach(function(client, buffer)
            if client.name == "tsserver" then
              -- stylua: ignore
              vim.keymap.set("n", "<leader>co", "TypescriptOrganizeImports",
                { buffer = buffer, desc = "Organize Imports" })
              vim.keymap.set(
                "n",
                "<leader>cR",
                "TypescriptRenameFile",
                { desc = "Rename File", buffer = buffer }
              )
            end
          end)
          require("typescript").setup({
            disable_commands = false, -- prevent the plugin from creating Vim commands
            debug = false,      -- enable debug logging for commands
            go_to_source_definition = {
              fallback = true,  -- fall back to standard LSP definition on failure
            },
            server = opts,
          })
          return true
        end,
      },
    },
  },
}
