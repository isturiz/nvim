local M = {}

local lsp_utils = require("plugins.lsp.utils")
local icons = require("itz.icons")

local function lsp_init()
  local signs = {
    { name = "DiagnosticSignError", text = icons.diagnostics.Error },
    { name = "DiagnosticSignWarn",  text = icons.diagnostics.Warning },
    { name = "DiagnosticSignHint",  text = icons.diagnostics.Hint },
    { name = "DiagnosticSignInfo",  text = icons.diagnostics.Info },
  }
  for _, sign in ipairs(signs) do
    vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = sign.name })
  end

  -- LSP handlers configuration
  local config = {
    float = {
      focusable = true,
      style = "minimal",
      border = "rounded",
    },
    views = {
      mappings = {
        i = { ["<esc>"] = require("plugins.lsp.utils").close_float },
        n = { ["<esc>"] = require("plugins.lsp.utils").close_float },
      },
    },
    diagnostic = {
      --virtual_text = { spacing = 2, prefix = "" },
      signs = {
        active = signs,
      },
      underline = true,
      update_in_insert = false,
      severity_sort = true,
      float = {
        focusable = true,
        style = "minimal",
        border = "rounded",
        source = "always",
        header = "",
        prefix = "",
      },
      -- virtual_lines = true,
      virtual_text = false,
    },
  }

  -- Diagnostic configuration
  --vim.diagnostic.config(config.diagnostic)
  -- Disable virtual_text since it's redundant due to lsp_lines.
  vim.diagnostic.config(config.diagnostic)

  -- Hover configuration
  --vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, config.float)

  -- Signature help configuration
  --vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, config.float)
end

function M.setup(_, opts)
  lsp_utils.on_attach(function(client, buffer)
    require("plugins.lsp.format").on_attach(client, buffer)
    require("plugins.lsp.keymaps").on_attach(client, buffer)
  end)

  lsp_init() -- diagnostics, handlers updatable

  local servers = opts.servers
  require("mason-lspconfig").setup({ ensure_installed = vim.tbl_keys(servers) })
  require("mason-lspconfig").setup_handlers({
    function(server)
      local server_opts = servers[server] or {}
      server_opts.capabilities = lsp_utils.capabilities()
      if opts.setup[server] then
        if opts.setup[server](server, server_opts) then
          return
        end
      elseif opts.setup["*"] then
        if opts.setup["*"](server, server_opts) then
          return
        end
      end
      require("lspconfig")[server].setup(server_opts)
    end,
  })
end

return M
