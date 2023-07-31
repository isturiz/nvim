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
        style = "storm",
        on_highlights = function(hl, colors)
          -- hl.SpellBad = {
          --   fg = colors.red,        -- Color del texto subrayado
          --   bg = colors.white,  -- Color del fondo del subrayado
          --   style = "underline",    -- Estilo del subrayado (puedes cambiarlo a "undercurl" para un subrayado ondulado)
          -- }
          -- hl.LspReferenceText = { -- Modifica el resaltado del texto de referencia
          --   bg = colors.white, -- Cambia este color al que prefieras
          -- }
          -- hl.LspReferenceWrite = { -- Modifica el resaltado del texto de referencia de escritura
          --   bg = colors.white, -- Cambia este color al que prefieras
          -- }
          -- hl.fg_gutter = colors.white
        -- hl.LineNr = {
        --   fg = colors.yellow
        -- }
        -- hl.CursorLineNr = {
        --   fg = colors.yellow
        -- }
        end
      }
      -- tokyonight.load()
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
      require("gruvbox").load()
    end,
  },
}
