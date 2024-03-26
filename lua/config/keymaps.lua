-- set leader key
vim.g.mapleader = " "

vim.keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })
vim.keymap.set("n", "<leader>w", ":w<CR>", { desc = "Write" })
vim.keymap.set("n", "<leader>q", ":q<ESC>", { desc = "Quit" })

-- The best remap
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], {desc = "Edit word"})

-- Idk this
--vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
--vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- Ex mode
--vim.keymap.set("n", "<leader>oe", vim.cmd.Ex)
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

--vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
--vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
--vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
--vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- delete without copy in the clipboard
vim.keymap.set('n', 'x', '"_x', { noremap = true })


-- Remapear la tecla 'dd' para que elimine la línea sin copiarla al portapapeles si está en blanco
vim.keymap.set('n', 'dd', [[:lua delete_line_without_copy()<CR>]], { noremap = true, silent = true })

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
vim.keymap.set('n', '<leader>bd', ':bd!<cr>', {desc = "Close current buffer" })

---- Others
vim.keymap.set('', '<leader>rr', ':source %<cr>', { desc = "Source the current file" })

vim.keymap.set('v', '>', '>gv', { desc = "after tab in re-select the same"})
vim.keymap.set('v', '<', '<gv', { desc = "after tab out re-select the same"})

vim.keymap.set('n', 'n', 'nzzzv', { desc = "Goes to the next result on the seach and put the cursor in the middle"})
vim.keymap.set('n', 'N', 'Nzzzv', { desc = "Goes to the prev result on the seach and put the cursor in the middle"})

