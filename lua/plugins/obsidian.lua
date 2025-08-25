local vaults = {
  {
    name = "personal",
    path = '~/obsidian/personal',
    overrides = {
      notes_subdir = "limbo",
    },
  },
  {
    name = "workspaces",
    path = '~/obsidian/work'
  },

}

return {
  "obsidian-nvim/obsidian.nvim",
  version = "*", -- recommended, use latest release instead of latest commit
  lazy = true,
  ft = "markdown",
  event = { "BufReadPre " .. vim.fn.expand("~") .. "**/Obsidian/**.md" },
  keys = {
    { "<leader>oo", "<cmd>Obsidian open<cr>",         desc = "Open in app" },
    { "<leader>on", "<cmd>Obsidian new<cr>",          desc = "New note" },
    { "<leader>oc", "<cmd>Obsidian check<cr>",        desc = "Toggle checkbox" },
    { "<leader>of", "<cmd>Obsidian quick_switch<cr>", desc = "Find note" },
    { "<leader>ob", "<cmd>Obsidian backlinks<cr>",    desc = "Backlinks to this note" },
    { "<leader>od", "<cmd>Obsidian today<cr>",        desc = "Daily note" },
    { "<leader>oy", "<cmd>Obsidian yesterday<cr>",    desc = "Yesterday's note" },
    { "<leader>ot", "<cmd>Obsidian yomorrow<cr>",     desc = "Tomorrow's note" },
    { "<leader>oT", "<cmd>Obsidian template<cr>",     desc = "Insert template" },
    { "<leader>os", "<cmd>Obsidian search<cr>",       desc = "Search notes" },
    { "<leader>ow", "<cmd>Obsidian workspace<cr>",    desc = "Show workspace" },
    { "<leader>ol", "<cmd>Obsidian links<cr>",        desc = "Link to an existing note", mode = "x" },
    { "<leader>oL", "<cmd>ObsidianLinkNew<cr>",       desc = "Link to a new note",       mode = "x" },
    { "<leader>so", "<cmd>Obsidian search<cr>",       desc = "Obsidian notes" },
  },
  ---@module 'obsidian'
  ---@type obsidian.config
  opts = {

    ------------
    -- settings
    ------------
    workspaces = vaults,
    daily_notes = {
      -- Optional, if you keep daily notes in a separate directory.
      folder = "dailies",
      date_format = "%Y-%m-%d",
      -- Optional, default tags to add to each new daily note created.
      default_tags = { "daily-notes" },
      -- Optional, if you want to automatically insert a template from your template directory like 'daily.md'
      template = nil,
      -- Optional, if you want `Obsidian yesterday` to return the last work day or `Obsidian tomorrow` to return the next work day.
      workdays_only = true,
    },
    new_notes_location = "current_dir",

    templates = {
      folder = "templates",
      date_format = "%Y-%m-%d-%a",
      time_format = "%H:%M",
    },
    backlinks = {
      parse_headers = true,
    },
    attachments = {
      img_folder = "assets/imgs",
      img_name_func = function()
        return string.format("Pasted image %s", os.date "%Y%m%d%H%M%S")
      end,
      confirm_img_paste = true,
    },
    ------------
    -- technical
    ------------
    legacy_commands = false,
    picker = {
      name = "snacks.pick",
      note_mappings = {
        new = "<C-n>",
      },
    },
    completion = {
      nvim_cmp = false,
      blick = true,
    },
  },
}
