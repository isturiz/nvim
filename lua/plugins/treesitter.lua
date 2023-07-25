local filetypes = {
  "html",
  "javascriptreact",
  "typescriptreact",
  "vue",
  "tsx",
  "jsx",
  "rescript",
  "xml",
  "markdown",
  "glimmer",
  "handlebars",
  "hbs",
  "http",
  "css",
}
local skip_tags = {
  "area",
  "base",
  "br",
  "col",
  "command",
  "embed",
  "hr",
  "img",
  "slot",
  "input",
  "keygen",
  "link",
  "meta",
  "param",
  "source",
  "track",
  "wbr",
  "menuitem",
}

return {
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      --"nvim-treesitter/playground",
      "RRethy/nvim-treesitter-endwise",
      "windwp/nvim-ts-autotag",
      "hiphish/rainbow-delimiters.nvim",
    },
    version = false, -- last release is way too old and doesn't work on Windows
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      sync_install = false,
      auto_install = true,
      ensure_installed = {
        "bash",
        "dockerfile",
        "html",
        "lua",
        "http",
        "json",
        "markdown",
        "markdown_inline",
        "query",
        "regex",
        "vue",
        "dart",
        "javascript",
        "typescript",
        "yaml",
        "prisma",
      },
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      indent = { enable = true, disable = { "python" } },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "gnn",
          node_incremental = "grn",
          scope_incremental = "grc",
          node_decremental = "grm",
        },
      },
      matchup = {
        enable = true,
      },
      endwise = {
        enable = true,
      },
      autotag = {
        enable = true,
      },
    },
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
      require("nvim-ts-autotag").setup({
        filetypes = filetypes,
        skip_tags = skip_tags,
      })
      local rainbow_delimiters = require("rainbow-delimiters")

      vim.g.rainbow_delimiters = {
        strategy = {
          [""] = rainbow_delimiters.strategy["global"],
          vim = rainbow_delimiters.strategy["local"],
        },
        query = {
          [""] = "rainbow-delimiters",
          lua = "rainbow-blocks",
        },
        highlight = {
          "RainbowDelimiterRed",
          "RainbowDelimiterYellow",
          "RainbowDelimiterBlue",
          "RainbowDelimiterOrange",
          "RainbowDelimiterGreen",
          "RainbowDelimiterViolet",
          "RainbowDelimiterCyan",
        },
      }

    end,
  },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      local npairs = require("nvim-autopairs")
      npairs.setup({
        check_ts = true,
      })
    end,
  },
  {
    "ckolkey/ts-node-action",
    dependencies = { "nvim-treesitter" },
    enabled = true,
    opts = {},
    keys = {
      {
        "<leader>na",
        function()
          require("ts-node-action").node_action()
        end,
        desc = "Node Action",
      },
    },
  },
  {
    "Wansmer/treesj",
    keys = {
      { "<leader>ts", "<cmd>TSJToggle<cr>", desc = "Toggle" },
    },
    cmd = { "TSJToggle", "TSJSplit", "TSJJoin" },
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function()
      require("treesj").setup({
        use_default_keymaps = false,
      })
    end,
  },
}
