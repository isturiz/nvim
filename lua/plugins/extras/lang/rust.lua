return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, { "rust" })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = { "simrat39/rust-tools.nvim", "rust-lang/rust.vim" },
    opts = {
      servers = {
        rust_analyzer = {
          settings = {
            ["rust-analyzer"] = {
              cmd = { "rustc", "run", "stable", "rust-analyzer" }
            },

            --[[ ["rust-analyzer"] = {
              cargo = { allFeatures = true },
              checkOnSave = {
                command = "cargo clippy",
                extraArgs = { "--no-deps" },
              },
            }, ]]

          },
        },
      },
      setup = {
        rust_analyzer = function(_, opts)
          local lsp_utils = require "plugins.lsp.utils"
          lsp_utils.on_attach(function(client, buffer)
            if client.name == "rust_analyzer" then
              -- stylua: ignore
              vim.keymap.set("n", "<leader>rr", ":RustRunnables<CR>", { silent = true, buffer = buffer, desc = "Runnables" })
              vim.keymap.set("n", "<leader>rh", ":RustHoverActions<CR>", { silent = true, buffer = buffer, desc = "Runnables" })
              vim.keymap.set("n", "<leader>ra", ":RustCodeAction<CR>", { silent = true, buffer = buffer, desc = "Runnables" })
            end
          end)
          require("rust-tools").setup { server = opts }
          return true
        end,
      },
    },
  },
}
