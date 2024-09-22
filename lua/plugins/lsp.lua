return {
  "neovim/nvim-lspconfig",

  dependencies = {
    "williamboman/mason.nvim",
    "folke/neodev.nvim",
  },

  keys = {
    { "<space>e", vim.diagnostic.open_float, desc = "Open diagnostic float window" },
    { "[d", vim.diagnostic.goto_prev, desc = "Go to previous diagnostic" },
    { "]d", vim.diagnostic.goto_next, desc = "Go to next diagnostic" },
    { "<space>q", vim.diagnostic.setloclist, desc = "Add diagnostics to loclist" },
    { "gD", function() vim.lsp.buf.declaration() end, desc = "Go to declaration" },
    { "gd", function() vim.lsp.buf.definition() end, desc = "Go to definition" },
    { "K", function() vim.lsp.buf.hover() end, desc = "Show hover info" },
    { "gi", function() vim.lsp.buf.implementation() end, desc = "Go to implementation" },
    { "<C-k>", function() vim.lsp.buf.signature_help() end, desc = "Show signature help" },
    { "<space>D", function() vim.lsp.buf.type_definition() end, desc = "Go to type definition" },
    { "<space>rn", function() vim.lsp.buf.rename() end, desc = "Rename symbol" },
    { "<space>ca", function() vim.lsp.buf.code_action() end, desc = "Code action" },
    { "gr", function() vim.lsp.buf.references() end, desc = "Find references" },
    {
      "<space>f",
      function()
        vim.lsp.buf.format { async = true }
      end,
      desc = "Format buffer"
    },
  },

  config = function()
    local on_attach = function(_, bufnr)
      -- Buffer local options and keymaps
      vim.bo[bufnr].omnifunc = 'v:lua.vim.lsp.omnifunc'
    end

    -- Language server configurations
    require("neodev").setup()

    require("lspconfig").lua_ls.setup({
      on_attach = on_attach,
      settings = {
        Lua = {
          telemetry = { enable = false },
          workspace = { checkThirdParty = false },
        }
      }
    })

    require("lspconfig").html.setup({
      on_attach = on_attach,
      filetypes = { "html", "typescriptreact", "typescript.tsx", "astro" }
    })

    require("lspconfig").ts_ls.setup({
      on_attach = on_attach,
      filetypes = { "typescript", "typescriptreact", "javascriptreact", "javascript" },
    })

    require("lspconfig").pyright.setup({ on_attach = on_attach })
    require("lspconfig").astro.setup({ on_attach = on_attach })
    require("lspconfig").cssls.setup({ on_attach = on_attach })
    require("lspconfig").tailwindcss.setup({
      on_attach = on_attach,
      filetypes = { "html", "typescriptreact", "typescript.tsx", "astro" },
    })

    -- XML formatting configuration
    local function format_xml()
      local clients = vim.lsp.get_active_clients({ bufnr = 0 })
      local lsp_formatted = false
      for _, client in ipairs(clients) do
        if client.server_capabilities.documentFormattingProvider then
          vim.lsp.buf.format({ async = true })
          lsp_formatted = true
          break
        end
      end
      if not lsp_formatted then
        vim.cmd([[ %!xmllint --format - ]])
      end
    end
  end
}
