-- set leader key
vim.g.mapleader = " "

vim.keymap.set("n", "<leader>q", ":q<ESC>", { desc = "Quit" })


-- vim.keymap.set("n", "<leader>pv", function() vim.cmd.Ex() end, { desc = "Open netrw in explorer mode" })

vim.keymap.set('n', 'x', '"_x', { noremap = true, desc = "delete without copy in the clipboard" })

vim.keymap.set('n', 'dd', [[:lua delete_line_without_copy()<CR>]],
  { noremap = true, silent = true, desc = "dd delete without copy to the clipboard" })

-- Función para verificar si una línea está en blanco
local function is_blank_line()
  local current_line = vim.fn.getline('.')
  return current_line:match('^%s*$') ~= nil
end

-- Función para eliminar la línea sin copiarla al portapapeles si está en blanco
function _G.delete_line_without_copy()
  if is_blank_line() then
    vim.cmd(":delete _")
  else
    vim.cmd(":delete")
  end
end

---- Buffers
vim.keymap.set('n', '<leader>bd', ':bd!<cr>', { desc = "Close current buffer" })

--- normal mode
vim.keymap.set('n', 'n', 'nzzzv', { desc = "Goes to the next result on the seach and put the cursor in the middle" })
vim.keymap.set('n', 'N', 'Nzzzv', { desc = "Goes to the prev result on the seach and put the cursor in the middle" })

--- utils and actions
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "Edit word globally" })
vim.keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })
vim.keymap.set('v', '>', '>gv', { desc = "after tab in re-select the same" })
vim.keymap.set('v', '<', '<gv', { desc = "after tab out re-select the same" })
vim.keymap.set('', '<leader>rr', ':source %<cr>', { desc = "Source the current file" })
