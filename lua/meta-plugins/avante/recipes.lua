--[[
  Adapted from the original work of @adalessa.
  Provides context-aware text/code operations (grammar, summarization, optimization, etc.).
--]]

-- === Constants ===
local AVANTE_ACTIONS = {
  grammar_correction = "Correct the text to standard English, but keep any code blocks inside intact.",
  keywords = "Extract the main keywords from the following text",
  code_readability = [[
    You must identify any readability issues in the code snippet.
    Some readability issues to consider:
    - Unclear naming
    - Unclear purpose
    - Redundant or obvious comments
    - Lack of comments
    - Long or complex one liners
    - Too much nesting
    - Long variable names
    - Inconsistent naming and code style.
    - Code repetition
    You may identify additional problems. The user submits a small section of code from a larger file.
    Only list lines with readability issues, in the format <line_num>|<issue and proposed solution>
    If there's no issues with code respond with only: <OK>
  ]],
  optimize_code = "Optimize the following code",
  summarize = "Summarize the following text",
  explain_code = "Explain the following code",
  complete_code = "Complete the following codes written in %s",
  add_docstring = "Add docstring to the following codes",
  fix_bugs = "Fix the bugs inside the following codes if any",
  add_tests = "Implement tests for the following code",
}

local keymap_opts = { noremap = true, silent = true }

--- Helper to open the Avante edit window and submit an action.
---@param request string The prompt/question to submit.
local function populate_edit_window(request)
  local ok, avante_api = pcall(require, "avante.api")
  if not ok then
    vim.notify("avante.api not found!", vim.log.levels.ERROR)
    return
  end
  avante_api.edit()
  local bufnr = vim.api.nvim_get_current_buf()
  local winid = vim.api.nvim_get_current_win()
  if not bufnr or not winid then return end
  vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, { request })
  -- Optionally set the cursor position to the end of the input
  vim.api.nvim_win_set_cursor(winid, { 1, #request + 1 })
  -- Simulate Ctrl+S keypress to submit
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-s>", true, true, true), "v", true)
end

--- Returns the complete_code prompt for the current buffer's filetype.
local function get_complete_code_prompt()
  return string.format(AVANTE_ACTIONS.complete_code, vim.bo.filetype)
end

-- === Key Mappings Table ===
local mappings = {
  -- Normal & Visual mode (ask actions)
  -- { mode = { "n", "v" }, key = "<leader>ag", question = AVANTE_ACTIONS.grammar_correction, desc = "Grammar Correction (ask)" },
  -- { mode = { "n", "v" }, key = "<leader>ak", question = AVANTE_ACTIONS.keywords, desc = "Keywords (ask)" },
  -- { mode = { "n", "v" }, key = "<leader>al", question = AVANTE_ACTIONS.code_readability, desc = "Code Readability Analysis (ask)" },
  -- { mode = { "n", "v" }, key = "<leader>ao", question = AVANTE_ACTIONS.optimize_code, desc = "Optimize Code (ask)" },
  -- { mode = { "n", "v" }, key = "<leader>am", question = AVANTE_ACTIONS.summarize, desc = "Summarize Text (ask)" },
  -- { mode = { "n", "v" }, key = "<leader>ax", question = AVANTE_ACTIONS.explain_code, desc = "Explain Code (ask)" },
  -- { mode = { "n", "v" }, key = "<leader>ac", question = get_complete_code_prompt, desc = "Complete Code (ask)" },
  -- { mode = { "n", "v" }, key = "<leader>ad", question = AVANTE_ACTIONS.add_docstring, desc = "Add Docstring (ask)" },
  -- { mode = { "n", "v" }, key = "<leader>ab", question = AVANTE_ACTIONS.fix_bugs, desc = "Fix Bugs (ask)" },
  -- { mode = { "n", "v" }, key = "<leader>au", question = AVANTE_ACTIONS.add_tests, desc = "Add Tests (ask)" },

  -- Visual mode only (edit actions)
  { mode = "v", key = "<leader>aG", question = AVANTE_ACTIONS.grammar_correction, desc = "Grammar Correction (edit)" },
  { mode = "v", key = "<leader>aK", question = AVANTE_ACTIONS.keywords, desc = "Keywords (edit)" },
  { mode = "v", key = "<leader>aO", question = AVANTE_ACTIONS.optimize_code, desc = "Optimize Code (edit)" },
  { mode = "v", key = "<leader>aC", question = get_complete_code_prompt, desc = "Complete Code (edit)" },
  { mode = "v", key = "<leader>aD", question = AVANTE_ACTIONS.add_docstring, desc = "Add Docstring (edit)" },
  { mode = "v", key = "<leader>aB", question = AVANTE_ACTIONS.fix_bugs, desc = "Fix Bugs (edit)" },
  { mode = "v", key = "<leader>aU", question = AVANTE_ACTIONS.add_tests, desc = "Add Tests (edit)" },
}

--- Set up all key mappings for Avante actions.
for _, map in ipairs(mappings) do
  local question = type(map.question) == "function" and map.question() or map.question
  vim.keymap.set(map.mode, map.key, function()
    if map.mode == "v" then
      populate_edit_window(question)
    else
      require("avante.api").ask({ question = question })
    end
  end, vim.tbl_extend("force", { desc = map.desc }, keymap_opts))
end

-- Optional: Integration with 'menu' plugin for a popup menu of actions
local ok_menu, menu = pcall(require, "menu")
if ok_menu then
  vim.keymap.set({ "n", "v" }, "<leader>aM", function()
    local menu_items = {}
    for _, map in ipairs(mappings) do
      local question = type(map.question) == "function" and map.question() or map.question
      table.insert(menu_items, {
        name = map.desc,
        rtxt = map.key,
        cmd = function()
          if map.mode == "v" then
            populate_edit_window(question)
          else
            require("avante.api").ask({ question = question })
          end
        end,
      })
    end
    menu.open(menu_items)
  end, { desc = "Avante AI Action Menu" })
end
