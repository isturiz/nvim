return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = {
    "nvim-treesitter/nvim-treesitter-textobjects",
  },
  build = ":TSUpdate",
  event = "VeryLazy",
  main  = "nvim-treesitter.configs",
  opts = {
    ensure_installed = {
      "lua",
      "luadoc",
      "javascript",
      "typescript",
      "html",
      "css",
      "markdown",
      "markdown_inline",
      "rust",
      "svelte",
      "astro",
      "python",
      "arduino",
      "angular",
      "bash",
      "csv",
      "json",
      "tsx",
      "php",
      "phpdoc",
      "regex",
      "tmux",
    },
    highlight = {
      enable = true,
    },
    indent = {
      enable = true,
    },
    textobjects = {
      select = {
        enable = true,
        lookahead = true,
        keymaps = {
          ["af"] = "@function.outer",
          ["if"] = "@function.inner",
          ["ac"] = "@conditional.outer",
          ["ic"] = "@conditional.inner",
          ["al"] = "@loop.outer",
          ["il"] = "@loop.inner",
        }
      }
    },
  },
}
