local filetype_hook = function(filepath, bufnr, opts)
  -- Here for example you can say: if ft == "xyz" then this_regex_highlighing else nothing end
  --
  local is_image = function(filepath)
    local image_extensions = { "png", "jpg" } -- Supported image formats
    local split_path = vim.split(filepath:lower(), ".", { plain = true })
    local extension = split_path[#split_path]
    return vim.tbl_contains(image_extensions, extension)
  end
  if not is_image(filepath) then
    return true
  end
  local ui = require "image.ui"
  local options = require "image.options"
  local dimensions = require "image.dimensions"
  local api = require "image.api"
  local config = require "image.config"
  local user_opts = {
    render = {
      foreground_color = true,
      background_color = true,
    },
  }
  local global_opts = vim.tbl_deep_extend("force", config.DEFAULT_OPTS, user_opts)

  local ascii_width, ascii_height, horizontal_padding, vertical_padding, img_width, img_height =
    dimensions.calculate_ascii_width_height(opts.winid, filepath, global_opts)
  options.set_options_before_render(bufnr)
  ui.buf_clear(bufnr)
  local label = ui.create_label(
    filepath,
    ascii_width,
    horizontal_padding,
    global_opts.render.show_image_dimensions,
    img_width,
    img_height
  )

  api.get_ascii_data_sync(filepath, ascii_width, ascii_height, global_opts, function(ascii_data)
    ui.buf_insert_data_with_padding(bufnr, ascii_data, horizontal_padding, vertical_padding, label, global_opts)

    options.set_options_after_render(bufnr)
  end)
  return false
end

return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      "nvim-telescope/telescope-file-browser.nvim",
      "nvim-telescope/telescope-project.nvim",
      "ahmedkhalf/project.nvim",
      { "cljoly/telescope-repo.nvim",               version = false },
      "stevearc/aerial.nvim",
      "nvim-lua/plenary.nvim",
    },
    cmd = "Telescope",
    keys = {
      { "<leader>fo", "<cmd>Telescope oldfiles<cr>",     desc = "Recent" },
      { "<leader>fb", "<cmd>Telescope buffers<cr>",      desc = "Buffers" },
      { "<leader>fr", "<cmd>Telescope file_browser<cr>", desc = "Browser" },
      { "<leader>ff", "<cmd>Telescope find_files<cr>",   desc = "Browser" },
      { "<leader>rl", "<cmd>Telescope repo list<cr>",    desc = "Search" },
      { "<leader>ht", "<cmd>Telescope help_tags<cr>",    desc = "Search" },
      {
        "<leader>pp",
        function()
          require("telescope").extensions.project.project({ display_type = "minimal" })
        end,
        desc = "List",
      },
      { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Workspace" },
      { "<leader>fc", "<cmd>Telescope commands<cr>",  desc = "Commands" },
      {
        "<leader>sb",
        function()
          require("telescope.builtin").current_buffer_fuzzy_find()
        end,
        desc = "Buffer",
      },
      { "<leader>st", "<cmd>Telescope aerial<cr>", desc = "Outline" },
    },
    config = function(_, _)
      local telescope = require("telescope")
      local icons = require("merlo.icons")
      local actions = require("telescope.actions")
      local actions_layout = require("telescope.actions.layout")
      local mappings = {
        i = {
          ["<C-j>"] = actions.move_selection_next,
          ["<C-k>"] = actions.move_selection_previous,
          ["<C-n>"] = actions.cycle_history_next,
          ["<C-p>"] = actions.cycle_history_prev,
          ["?"] = actions_layout.toggle_preview,
          --open all selected
          ["<C-x>"] = actions.send_to_qflist + actions.open_qflist,
          ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
          ["<C-s>"] = actions.select_horizontal,
          ["<C-v>"] = actions.select_vertical,
          ["<C-t>"] = actions.select_tab,
          ["<C-u>"] = actions.select_all,
          ["<C-c>"] = actions.close,
          ["<C-a>"] = actions.toggle_all,
          ["<C-d>"] = actions.delete_buffer,
          ["<C-o>"] = actions.smart_send_to_qflist + actions.open_qflist,
        },
      }

      local opts = {
        defaults = {
          prompt_prefix = icons.ui.Telescope .. " ",
          selection_caret = icons.ui.Forward .. " ",
          mappings = mappings,
          border = {},
          borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
          color_devicons = true,
          preview = {
            filetype_hook = filetype_hook,
          },
        },
        pickers = {
          find_files = {
            theme = "dropdown",
            previewer = false,
            hidden = true,
            find_command = { "rg", "--files", "--hidden", "-g", "!.git" },
          },
          git_files = {
            theme = "dropdown",
            previewer = false,
          },
          buffers = {
            theme = "dropdown",
            previewer = false,
          },
        },
        extensions = {
          file_browser = {
            theme = "dropdown",
            previewer = true,
            hijack_netrw = true,
            mappings = mappings,
          },
          project = {
            hidden_files = false,
            theme = "dropdown",
          },
          repo = {
            list = {
              fd_opts = {
                "--no-ignore-vcs",
              },
              search_dirs = {
                "~/Projects",
              },
            },
          },
          --live_grep ignore node_modules folder
          live_grep = {
            path_display = { "shorten" },
            layout_config = {
              preview_width = 0.65,
            },
            grep_open_files = true,
            grep_open_files_with_term = true,
            --[[ search_dirs = {
              "~/my_projects",
            }, ]]
            search = {
              "rg",
              "--hidden",
              "--no-heading",
              "--with-filename",
              "--line-number",
              "--column",
              "--smart-case",
              "--ignore",
              "--glob",
              "!.git",
              "--glob",
              "!node_modules",
            },
          },
        },
      }
      telescope.setup(opts)
      telescope.load_extension("fzf")
      telescope.load_extension("file_browser")
      telescope.load_extension("project")
      telescope.load_extension("projects")
      telescope.load_extension("aerial")
      telescope.load_extension("repo")
    end,
  },
  {
    "stevearc/aerial.nvim",
    config = true,
  },
  {
    "ahmedkhalf/project.nvim",
    config = function()
      require("project_nvim").setup({
        detection_methods = { "pattern", "lsp" },
        patterns = { ".git" },
        ignore_lsp = { "null-ls" },
      })
    end,
  },
}
