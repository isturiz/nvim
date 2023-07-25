local ts_utils = require("nvim-treesitter.ts_utils")
local M = {}

local function get_master_node()
  local node = ts_utils.get_node_at_cursor()
  if node == nil then
    error("No node at cursor")
    return
  end
  local root = ts_utils.get_root_for_node(node)
  --local start_row, _, end_row, _ = root:range()
  local start_row = node:start()
  local parent = node:parent()
  while parent ~= nil and parent ~= root and parent:start() == start_row do
    --[[ if parent == root then
      break
    end
    start_row = parent:start()
    parent = parent:parent() --]]
    node = parent
    parent = node:parent()
  end
  return node
end

M.select = function()
  local node = get_master_node()
  local bufnr = vim.api.nvim_get_current_buf()

  ts_utils.update_selection(bufnr, node)
end

M.delete = function(for_change)
  local node = get_master_node()
  local bufnr = vim.api.nvim_get_current_buf()
  local start_row, start_col, end_row, end_col = node:range()
  local to_replace = for_change and " " or ""

  vim.api.nvim_buf_set_text(bufnr, start_row, start_col, end_row, end_col, { to_replace })
end

M.replace = function()
  local node = M.delete(true)
  vim.cmd("startinsert")
end

M.copy = function()
  local node = get_master_node()
  local bufnr = vim.api.nvim_get_current_buf()
  local start_row, start_col, end_row, end_col = node:range()
  local lines = vim.api.nvim_buf_get_lines(bufnr, start_row, end_row + 1, false)
  vim.fn.setreg("+", lines)
  print("Copied to register +")
end

return M
