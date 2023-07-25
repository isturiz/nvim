return {
  "folke/zen-mode.nvim",
  config = true,
  keys = {
    {
      "<leader><leader>zz",
      function()
        require("zen-mode").toggle()
        vim.wo.wrap = false
        vim.wo.number = true
        vim.wo.rnu = true
      end,
    },
    {
      "<leader><leader>zZ",
      function()
        require("zen-mode").toggle()
        vim.wo.wrap = false
        vim.wo.number = false
        vim.wo.rnu = false
        vim.opt.colorcolumn = "0"
      end,
    },
    {
      "<leader><leader>zr",
      function()
        require("zen-mode").toggle()
        vim.wo.wrap = true
        vim.wo.number = true
        vim.wo.rnu = true
      end,
    },
    {
      "<leader><leader>zR",
      function()
        require("zen-mode").toggle()
        vim.wo.wrap = true
        vim.wo.number = false
        vim.wo.rnu = false
        vim.opt.colorcolumn = "0"
      end,
    },
  },
}
