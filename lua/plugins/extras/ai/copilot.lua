return {
    "github/copilot.vim",
    keys = { "<leader><leader>cpt" },
    config = function(_,_)
      vim.g.copilot_disable_default_keybindings = 1
      vim.g.copilot_no_tab_map = 1
      vim.api.nvim_set_keymap("i", "<C-l>", "copilot#Accept('<CR>')", { silent = true, noremap = true, expr = true })
      vim.api.nvim_set_keymap("i", "<C-]>", "copilot#Next()", { silent = true, noremap = true, expr = true })
    end,
    --commit = "8ba151a20bc1d7a5c72e592e51bfc925d5bbb837",
  }
