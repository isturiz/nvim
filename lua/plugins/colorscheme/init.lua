return {
  {
    "folke/styler.nvim",
    event = "VeryLazy",
    config = function()
      require("styler").setup {
        themes = {
          --markdown = { colorscheme = "gruvbox" },
          --help = { colorscheme = "gruvbox" },
        },
      }
    end,
  },
  {
    "Shatur/neovim-ayu",
    init = function(_)
      --vim.cmd[[colorscheme ayu]]
    end,
    lazy = false,
    opts = {
      mirage = false,
      dark = true,
      overrides = {}
    },
    config = function(opts,_)
      -- require("ayu").setup(opts)
    end,
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    config = function()
      local tokyonight = require "tokyonight"
      tokyonight.setup {
        style = "moon",
        on_highlights = function(hl, c)
          -- this ok
          hl.IlluminatedWordRead = { bg = "#3b4261", fg = c.fg }
          -- this is a test
          -- hl.IlluminatedWordRead = { fg = c.comment }
        --   hl.CursorLineNr = { fg = c.orange, bold = true }
        --   hl.LineNr = { fg = c.orange, bold = true }
        --   hl.LineNrAbove = { fg = c.fg_gutter }
        --   hl.LineNrBelow = { fg = c.fg_gutter }

        end,
      }

      tokyonight.load()
    end,
  },
  {
    "catppuccin/nvim",
    lazy = false,
    priority = 1000,
    name = "catppuccin",
    init = function()
      --vim.cmd[[colorscheme catppuccin-macchiato]]
    end,
  },
  {
    'navarasu/onedark.nvim',
    lazy = false,
    priority = 1000,
    config = function(_,_)
      require('onedark').setup{
        style = 'deep'
      }
      --require('onedark').load()
    end,
  },
  {
    'rose-pine/neovim',
    name = 'rose-pine',
    init = function(_)
      --vim.cmd[[colorscheme rose-pine-moon]]
    end,
  },
  {
    "ellisonleao/gruvbox.nvim",
    lazy = false,
    config = function()
      require("gruvbox").setup()
      --require("gruvbox").load()
    end,
  },
}
