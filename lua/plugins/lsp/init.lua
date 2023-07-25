return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      { "folke/neoconf.nvim", cmd = "Neoconf", config = true },
      { "folke/neodev.nvim", opts = {
        library = { plugins = { "neotest", "nvim-dap-ui" }, types = true },
      } },
      { 
        "j-hui/fidget.nvim", 
        config = {
          window = {
            blend = 0,              -- &winblend for the window
          },
          sources = {                 -- Sources to configure
            ['null-ls'] = {
              ignore = true,
            },
          },
        },
      },
      { "smjonas/inc-rename.nvim", config = true },
      { "ErichDonGubler/lsp_lines.nvim", config = true },
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "jay-babu/mason-null-ls.nvim",
    },
    opts = {
      servers = {
        lua_ls = {
          settings = {
            Lua = {
              workspace = {
                checkThirdParty = false,
              },
              completion = { callSnippet = "Replace" },
              telemetry = { enable = false },
              hint = {
                enable = false,
              },
            },
          },
        },
        dockerls = {},
        eslint = {
          settings = {
            -- helps eslint find the eslintrc when it's placed in a subfolder instead of the cwd root
            workingDirectory = { mode = "auto" },
          },
        },
      },
      setup = {
        eslint = function()
          vim.api.nvim_create_autocmd("BufWritePre", {
            callback = function(event)
              if require("lspconfig.util").get_active_client_by_name(event.buf, "eslint") then
                vim.cmd("EslintFixAll")
              end
            end,
          })
        end,
      },
      format = {
        timeout_ms = 3000,
      },
    },
    config = function(plugin, opts)
      require("plugins.lsp.servers").setup(plugin, opts)
    end,
  },
  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" } },
    opts = {
      ensure_installed = {
        "ruff",
        "phpcbf",
        "eslint_d",
        "prettier",
        "stylua",
        "phpcs",
      },
    },
    config = function(_, opts)
      require("mason").setup()
      local mr = require("mason-registry")
      local function ensure_installed()
        for _, tool in ipairs(opts.ensure_installed) do
          local p = mr.get_package(tool)
          if not p:is_installed() then
            p:install()
          end
        end
      end
      if mr.refresh then
        mr.refresh(ensure_installed)
      else
        ensure_installed()
      end
    end,
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    event = "BufReadPre",
    dependencies = {
      "mason.nvim",
    },
    config = function()
      local nls = require("null-ls")
      nls.setup({
        sources = {
          --here add new sources
          nls.builtins.formatting.phpcbf.with({ extra_args = { "--standard=PSR12" }}),
          nls.builtins.formatting.eslint,
          --prettier format in current buffer
          nls.builtins.formatting.prettier.with({ extra_args = { "--stdin-filepath", vim.api.nvim_buf_get_name(0) }}),
          nls.builtins.formatting.stylua,
          nls.builtins.diagnostics.eslint.with({ method = nls.methods.DIAGNOSTICS_ON_SAVE }),
          nls.builtins.diagnostics.ruff.with({ extra_args = { "--max-line-length=180" }, method = nls.methods.DIAGNOSTICS_ON_SAVE }),
          nls.builtins.diagnostics.phpcs.with({ extra_args = { "--standard=PSR12" }, method = nls.methods.DIAGNOSTICS_ON_SAVE }),

          nls.builtins.diagnostics.phpstan.with {
            to_temp_file = false,
            method = nls.methods.DIAGNOSTICS_ON_SAVE,
            command = "./vendor/bin/phpstan",
            condition = function ()
              return vim.fn.findfile("vendor/bin/phpstan") ~= ""
            end
          },
        },
      })
    end,
  },
  { "jay-babu/mason-null-ls.nvim", opts = { ensure_installed = nil, automatic_installation = true, automatic_setup = false } },
  {
    "utilyre/barbecue.nvim",
    event = "VeryLazy",
    dependencies = {
      "neovim/nvim-lspconfig",
      "SmiteshP/nvim-navic",
    },
    config = true,
  },
  {
    "folke/trouble.nvim",
    cmd = { "TroubleToggle", "Trouble" },
    opts = { use_diagnostic_signs = true },
    keys = {
      { "<leader>cd", "<cmd>TroubleToggle document_diagnostics<cr>", desc = "Document Diagnostics" },
      { "<leader>cD", "<cmd>TroubleToggle workspace_diagnostics<cr>", desc = "Workspace Diagnostics" },
    },
  },
}
