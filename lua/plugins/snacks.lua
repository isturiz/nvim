return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  keys = {
    {
      "<c-\\>",
      function()
        require("snacks").terminal()
      end,
      desc = "Toggle a terminal",
      mode = { "n", "t" },
    },

    {
      "<leader>z",
      function()
        require("snacks").zen()
      end,
      desc = "Toggle Zen Mode",
    },
    {
      "<leader>Z",
      function()
        require("snacks").zen.zoom()
      end,
      desc = "Toggle Zoom",
    },

    {
      "<leader>.",
      function()
        require("snacks").scratch()
      end,
      desc = "Toggle Scratch Buffer",
    },
    {
      "<leader>S",
      function()
        require("snacks").scratch.select()
      end,
      desc = "Select Scratch Buffer",
    },

    {
      "<leader>nh",
      function()
        require("snacks").notifier.show_history()
      end,
      desc = "Notification History",
    },
    {
      "<leader>bd",
      function()
        require("snacks").bufdelete()
      end,
      desc = "Delete Buffer",
    },
    {
      "<leader>cR",
      function()
        require("snacks").rename.rename_file()
      end,
      desc = "Rename File",
    },
    {
      "<leader>gcf",
      function()
        require("snacks").gitbrowse()
      end,
      desc = "Git Browse",
      mode = { "n", "v" },
    },
    {
      "<leader>gb",
      function()
        require("snacks").git.blame_line()
      end,
      desc = "Git Blame Line",
    },
    {
      "<leader>gf",
      function()
        require("snacks").lazygit.log_file()
      end,
      desc = "Lazygit Current File History",
    },
    {
      "<leader>lg",
      function()
        require("snacks").lazygit()
      end,
      desc = "Lazygit",
    },
    {
      "<leader>gl",
      function()
        require("snacks").lazygit.log()
      end,
      desc = "Lazygit Log (cwd)",
    },
    {
      "<leader>un",
      function()
        require("snacks").notifier.hide()
      end,
      desc = "Dismiss All Notifications",
    },
    -- { "]]",         function() Snacks.words.jump(vim.v.count1) end,  desc = "Next Reference",              mode = { "n", "t" } },
    -- { "[[",         function() Snacks.words.jump(-vim.v.count1) end, desc = "Prev Reference",              mode = { "n", "t" } },

    {
      "<leader>pp",
      function()
        require("snacks").picker.smart({ multi = { "buffers", "files" } })
      end,
      desc = "Smart Picker",
    },
    {
      "<leader>pf",
      function()
        require("snacks").picker.files()
      end,
      desc = "Files Picker",
    },
    {
      "<leader>pe",
      function()
        require("snacks").picker.buffers()
      end,
      desc = "Buffers Picker",
    },
    {
      "<leader>pg",
      function()
        require("snacks").picker.grep()
      end,
      desc = "Grep Picker",
    },
    {
      "<leader>ph",
      function()
        require("snacks").picker.help()
      end,
      desc = "Help Picker",
    },
    {
      "<leader>ps",
      function()
        require("snacks").picker.git_status()
      end,
      desc = "Git Status Picker",
    },
    {
      "<leader>:",
      function()
        require("snacks").picker.command_history()
      end,
      desc = "Command history picker",
    },
  },
  ---@type snacks.Config
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    bigfile = { enabled = true },
    dashboard = {
      enabled = true,
      preset = {
        header = [[ISTÚRIZ]]
      },
    },
    indent = { enabled = true },
    input = { enabled = true },
    picker = {
      enabled = true,
      layout = {
        -- best presets:
        preset = 'sidebar'
        -- preset = 'ivy_split'
      }
    },
    notifier = { enabled = true },
    quickfile = { enabled = true },
    scroll = { enabled = true },
    statuscolumn = { enabled = true },
    words = { enabled = true },
  },
}
