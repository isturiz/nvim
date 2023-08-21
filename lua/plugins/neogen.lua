return {
  "danymat/neogen",
  dependencies = { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate", version = false },
  keys = {
    { "<leader>an", "<Cmd>lua require('neogen').generate()<CR>" }
  },
  opts = {
    enabled = true,
    snippet_engine = "luasnip",
    languages = {
      go = {
        template = {
          annotation_convention = "godoc",
        },
      },
      lua = {
        template = {
          annotation_convention = "ldoc",
        },
      },
      javascript = {
        template = {
          annotation_convention = "jsdoc",
        },
      },
      typescript = {
        template = {
          annotation_convention = "tsdoc",
        },
      },
      typescriptreact = {
        template = {
          annotation_convention = "tsdoc",
        },
      },
    },
  }
}
