return {
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",

    config = function()
      local components = require "plugins.lualine.components"

      require("lualine").setup {
        options = {
          icons_enabled = true,
          theme = "auto",
          component_separators = { left = '', right = ''},
          section_separators = { left = '', right = ''},
          disabled_filetypes = {
            statusline = {},
            winbar = {},
          },
          always_divide_middle = true,
          globalstatus = true,
        },
        sections = {
          lualine_a = { "mode" },
          --lualine_b = { components.git_repo, "branch" },
          lualine_b = { { "branch", icon = "" }, "db_ui#statusline" },
          --[[ lualine_c = {
            components.diff,
            components.diagnostics,
            components.noice_command,
            components.noice_mode,
            components.separator,
            components.lsp_client,
          }, ]]

          lualine_c = { { "filename", file_status = true, path = 1 } },
          lualine_x = { "filename", components.spaces, "encoding", "fileformat", "filetype", "progress" },
          lualine_y = { "filetype" },
          lualine_z = { "location" },
        },
        extensions = { "toggleterm", "quickfix" },
      }
    end,
  },
}
