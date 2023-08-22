return {
  "nvim-lua/plenary.nvim",
  "MunifTanjim/nui.nvim",
  {
    "kyazdani42/nvim-web-devicons",
    dependencies = { "DaikyXendo/nvim-material-icon" },
    config = function()
      require("nvim-web-devicons").setup({
        override = require("nvim-material-icon").get_icons(),
      })
    end,
  },
  {
    "ziontee113/icon-picker.nvim",
    keys = {
      { "<Leader><Leader>i", "<cmd>IconPickerNormal nerd_font<cr>", mode = "n" },
      { "<Leader><Leader>y", "<cmd>IconPickerYank nerd_font<cr>",   mode = "n" },
      -- { "<C-o>",             "<cmd>IconPickerInsert nerd_font<cr>", mode = "i" }, -- this shortcut is already in use
    },
    opts = { disable_legacy_commands = true },
  },
  "jwalton512/vim-blade",
  { "tpope/vim-repeat",  event = "VeryLazy" },
  { "nacro90/numb.nvim", event = "BufReadPre", config = true },
  {
    "lukas-reineke/indent-blankline.nvim",
    event = "VeryLazy",
    opts = {
      char = "▏",
      space_char_blankline = " ",
      show_first_indent_level = false,
      show_current_context = true,
      show_current_context_start = true,
      filetype_exclude = {
        "help",
        "git",
        "markdown",
        "text",
        "terminal",
        "lspinfo",
        "packer",
      },
      buftype_exclude = {
        "terminal",
        "nofile",
      },
      char_highlight_list = {
        "IndentBlanklineIndent1",
        "IndentBlanklineIndent2",
        "IndentBlanklineIndent3",
        "IndentBlanklineIndent4",
        "IndentBlanklineIndent5",
        "IndentBlanklineIndent6",
      },
    },
    config = function(_, opts)
      vim.opt.termguicolors = true
      vim.cmd([[highlight IndentBlanklineIndent1 guifg=#E06C75 gui=nocombine]])
      vim.cmd([[highlight IndentBlanklineIndent2 guifg=#E5C07B gui=nocombine]])
      vim.cmd([[highlight IndentBlanklineIndent3 guifg=#98C379 gui=nocombine]])
      vim.cmd([[highlight IndentBlanklineIndent4 guifg=#56B6C2 gui=nocombine]])
      vim.cmd([[highlight IndentBlanklineIndent5 guifg=#61AFEF gui=nocombine]])
      vim.cmd([[highlight IndentBlanklineIndent6 guifg=#C678DD gui=nocombine]])
      require("indent_blankline").setup(opts)
    end,
  },
  {
    "stevearc/dressing.nvim",
    event = "VeryLazy",
    opts = {
      input = { relative = "editor" },
      select = {
        backend = { "telescope", "fzf", "builtin" },
      },
    },
  },
  {
    "rcarriga/nvim-notify",
    event = "User",
    opts = {
      -- background_colour = "#A3CCBE",
      timeout = 3000,
      max_height = function()
        return math.floor(vim.o.lines * 0.75)
      end,
      max_width = function()
        return math.floor(vim.o.columns * 0.75)
      end,
    },
    config = function()
      local notify = require("notify")
      -- this for transparency
      notify.setup({ background_colour = "#000000" })
      -- this overwrites the vim notify function
      vim.notify = notify.notify
    end,
  },
  {
    "numToStr/Comment.nvim",
    dependencies = { "JoosepAlviste/nvim-ts-context-commentstring" },
    keys = { { "gcc" }, { "gbc" }, { "gc", mode = "v" }, { "gb", mode = "v" } },
    config = function(_, _)
      local opts = {
        ignore = "^$",
        pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
      }
      require("Comment").setup(opts)
    end,
  },
  {
    "phaazon/hop.nvim",
    cmd = "HopWord",
    keys = {
      { "<leader>jp", "<Cmd>HopWord<CR>", mode = { "n" } },
    },
    branch = "v2",
    opts = { keys = "etovxqpdygfblzhckisuran" },
  },
  -- session management
  {
    "folke/persistence.nvim",
    enabled = false,
    event = "BufReadPre",
    opts = { options = { "buffers", "curdir", "tabpages", "winsize", "help" } },
    -- stylua: ignore
    keys = {
      { "<leader>qs", function() require("persistence").load() end,                desc = "Restore Session" },
      { "<leader>ql", function() require("persistence").load({ last = true }) end, desc = "Restore Last Session" },
      { "<leader>qd", function() require("persistence").stop() end,                desc = "Don't Save Current Session" },
    },
  },
  { "tpope/vim-surround", event = "BufReadPre" },
  {
    "folke/persistence.nvim",
    event = "BufReadPre",
    opts = { options = { "buffers", "curdir", "tabpages", "winsize", "help" } },
    -- stylua: ignore
    keys = {
      { "<leader>qs", function() require("persistence").load() end,                desc = "Restore Session" },
      { "<leader>ql", function() require("persistence").load({ last = true }) end, desc = "Restore Last Session" },
      { "<leader>qd", function() require("persistence").stop() end,                desc = "Don't Save Current Session" },
    },
  },
  {
    "petertriho/nvim-scrollbar",
    event = "BufReadPre",
    config = true,
  },
}
