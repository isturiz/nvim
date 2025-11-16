return {
  "rcarriga/nvim-dap-ui",
  config = true,
  keys = {
    {
      "<leader>du",
      function()
        require("dapui").toggle({})
      end,
      desc = "Dap UI"
    },
  },
  dependencies = {
      "nvim-neotest/nvim-nio",
      "theHamsta/nvim-dap-virtual-text",
  },
}
