return {
  "lewis6991/gitsigns.nvim",
  opts = {
    current_line_blame = false,
    signcolumn = false,
    numhl = true,
    max_file_length = 10000,
  },
  on_attach = function(bufnr)
    local gs = require("gitsigns")

    local function map(mode, lhs, rhs, desc)
      vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
    end

    -- Por ejemplo, el que querías:
    map("n", "<leader>nh", gs.next_hunk, "Git Next Hunk")
    map("n", "<leader>ph", gs.prev_hunk, "Git Previous Hunk")

    -- Otros útiles:
    map("n", "<leader>hs", gs.stage_hunk, "Stage Hunk")
    map("n", "<leader>hr", gs.reset_hunk, "Reset Hunk")
    map("n", "<leader>hp", gs.preview_hunk, "Preview Hunk")
  end,
}
