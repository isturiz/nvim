local keymap = vim.keymap.set
local default_opts = {noremap = true, silent = true}

--Beter escape using jk in insert and and exit in terminal mode
keymap("i", "jk", "<Esc>")
keymap("t", "jk", "<C-\\><C-n>")
keymap("t", "<C-h>", "<C-\\><C-n><C-w>h")
keymap("t", "<C-l>", "<C-\\><C-n><C-w>l")

-- don't use arrow keys
keymap("", "<up>", "<nop>", {noremap = true})
keymap("", "<down>", "<nop>", {noremap = true})
keymap("", "<left>", "<nop>", {noremap = true})
keymap("", "<right>", "<nop>", {noremap = true})

local keymaps = {

  -- activate / desactivate wrap line
  {"n", "<leader><leader>l", ":set wrap!<CR>"},

  -- clear search highlighting
  {"n", "<leader>/", ":nohl<CR>"},

  --{"n", "<C-t>", ":Term<CR>"},

  -- Paste over currently selected text without yanking it below
  {"v", "p", "\"_dP"},

  --resize a panel
  {"n", "<right>", ":vertical resize +5<CR>"},
  {"n", "<left>", ":vertical resize -5<CR>"},
  {"n", "<up>", ":resize +5<CR>"},
  {"n", "<down>", ":resize -5<CR>"},

  --to move the indentation of a code block with tab and shift tab
  {"v", "<Tab>", ">gv"},
  {"v", "<S-Tab>", "<gv"},

  -- fast file saving
  {"n", "<leader>w", ":w<CR>"},

  -- fast neovim quit
  {"n", "<leader>q", ":q<CR>"},

  -- move around splits using Ctrl + {h,j,k,l}
  {"n", "<C-h>", "<C-w>h"},
  {"n", "<C-j>", "<C-w>j"},
  {"n", "<C-k>", "<C-w>k"},
  {"n", "<C-l>", "<C-w>l"},

  -- Move Lines
  {"n", "<A-j>", ":m .+1<CR>=="},
  {"v", "<A-j>", ":m '>+1<CR>gv=gv"},
  {"i", "<A-j>", "<Esc>:m .+1<CR>==gi"},
  {"n", "<A-k>", ":m .-2<CR>=="},
  {"v", "<A-k>", ":m '<-2<CR>gv=gv"},
  {"i", "<A-k>", "<Esc>:m .-2<CR>==gi"},

  -- For my custom plugin
  {"n", "<leader>cps", ":lua require('custom.selector').select()<CR>"},
  {"n", "<leader>cpd", ":lua require('custom.selector').delete()<CR>"},
  {"n", "<leader>cpr", ":lua require('custom.selector').replace()<CR>"},
  {"n", "<leader>cpc", ":lua require('custom.selector').copy()<CR>"},
  {"n", "cp", ":let @+ = expand(\"%\")<CR>"},
}

--search and replace tip
--in visual mode selecting a text grup press ":" and "s/keymap(\(.*\))/{\1}" 
--in resume: "s" is for search funciton in neovim alfter "/keymap()" to select all text math with this.
--"\(" and "\)" to scape parenthesis to not considere this as command whatever as string
--".*" all repeated 
--"{\1}" brackeds is the txt to be replaced and "\1" all taked text from incide math pattern
--:%s/\v(^.+):\s*(.+)/"\1": "\2",
--s/(\(.*\), \(.*\))/(\2, \1) -- reserve params in a function
--
--for URL regex
--const pattern =
--/(https:\/\/www\.|http:\/\/www\.|https:\/\/|http:\/\/)?[a-zA-Z]{2,}(\.[a-zA-Z]{2,})(\.[a-zA-Z]{2,})?\/[a-zA-Z0-9]{2,}|((https:\/\/www\.|http:\/\/www\.|https:\/\/|http:\/\/)?[a-zA-Z]{2,}(\.[a-zA-Z]{2,})(\.[a-zA-Z]{2,})?)|(https:\/\/www\.|http:\/\/www\.|https:\/\/|http:\/\/)?[a-zA-Z0-9]{2,}\.[a-zA-Z0-9]{2,}\.[a-zA-Z0-9]{2,}(\.[a-zA-Z0-9]{2,})?/g
--//urls in array with lines in template string js
--console.log(pattern.test(urls));

local function setMappings(maps)
  for _, map in ipairs(maps) do
    vim.api.nvim_set_keymap(tostring(map[1]), tostring(map[2]), tostring(map[3]), default_opts)
  end
end
setMappings(keymaps)
