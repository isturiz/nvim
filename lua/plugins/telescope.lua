return {
  "nvim-telescope/telescope.nvim",

  tag = "0.1.6",

  event = 'VeryLazy',

  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope-file-browser.nvim",
  },
  config = function(opts)
    require('telescope').setup(opts)
    require('telescope').load_extension('fzf')
  end,

  keys = {
    {
      "<leader>pe",
      function()
        require("telescope.builtin").buffers()
      end,
      desc = "Telescope buffers",
    },
    -- {
    --   "<leader>rp",
    --   function()
    --     require("telescope.builtin").find_files({
    --       prompt_title = "Plugins",
    --       cwd = "~/.config/nvim/lua/plugins",
    --       attach_mappings = function(_, map)
    --         local actions = require("telescope.actions")
    --         local action_state = require("telescope.actions.state")
    --         map("i", "<c-y>", function(prompt_bufnr)
    --           local new_plugin = action_state.get_current_line()
    --           actions.close(prompt_bufnr)
    --           vim.cmd(string.format("edit ~/.config/nvim/lua/plugins/%s.lua", new_plugin))
    --         end)
    --         return true
    --       end
    --     })
    --   end,
    --   desc = "Telescope Find Plugins",
    -- },
    {
      "<leader>bb",
      function()
        require("telescope").extensions.file_browser.file_browser({ path = "%:h:p", select_buffer = true })
      end,
      desc = "Telescope file browser"
    },
  },
}
