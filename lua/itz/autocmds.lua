local function augroup(name)
  return vim.api.nvim_create_augroup("mnv_" .. name, { clear = true })
end

-- Check if we need to reload the file when it changed
vim.api.nvim_create_autocmd("FocusGained", { command = "checktime" })

-- go to last loc when opening a buffer
vim.api.nvim_create_autocmd("BufReadPost", {
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

-- windows to close
vim.api.nvim_create_autocmd("FileType", {
  group = augroup "close_with_q",
  pattern = {
    "OverseerForm",
    "OverseerList",
    "floggraph",
    "fugitive",
    --"git",
    "help",
    "lspinfo",
    "man",
    "qf",
    "query",
    "spectre_panel",
    "startuptime",
    "toggleterm",
    "tsplayground",
    "vim",
    "neoai-input",
    "neoai-output",
    "notify"
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
  end,
})

vim.api.nvim_set_hl(0, "TerminalCursorShape", { underline = true })

vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight on_yank",
  group = vim.api.nvim_create_augroup("highlight_yank", {}),
  pattern = "*",
  callback = function ()
    vim.highlight.on_yank({
      higroup = "IncSearch",
      timeout = 150,
    })  
  end,
})

-- start git messages in insert mode
vim.api.nvim_create_autocmd("FileType", {
  group = augroup "buf_check",
  pattern = { "NeogitCommitMessage" },
  command = "startinsert | 1",
})

-- Start insert mode
vim.api.nvim_create_autocmd({ "TermOpen" }, {
  group = augroup "auto_start_insert",
  callback = function(event)
    local hide = vim.bo.bufhidden
    if hide ~= "hide" then
      vim.cmd.startinsert()
    end
  end,
})
--to open a new terminal in split
vim.cmd [[command Term :botright vsplit term://$SHELL]]

vim.cmd [[highlight VertSplit guifg=fg]]
--hi vertsplit guifg=fg guibg=bg
--highlight VertSplit guifg=#11f0c3 guibg=#ff00ff
--vim.cmd("highlight VertSplit guifg=#11f0c3 guibg=#ff00ff")
--vim.cmd("hi Comment	ctermfg=Cyan guifg=#80a0ff gui=bold")
