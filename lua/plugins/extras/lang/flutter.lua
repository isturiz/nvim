return {
  "akinsho/flutter-tools.nvim",
  ft = "dart",
  cmd = "Flutter",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {
    ui = {
      -- the border type to use for all floating windows, the same options/formats
      -- used for ":h nvim_open_win" e.g. "single" | "shadow" | {<table-of-eight-chars>}
      border = "rounded",
      -- This determines whether notifications are show with `vim.notify` or with the plugin's custom UI
      -- please note that this option is eventually going to be deprecated and users will need to
      -- depend on plugins like `nvim-notify` instead.
      --notification_style = 'native'  | 'plugin',
    }
  }
}
