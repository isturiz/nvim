return {
  "sainnhe/sonokai",
  lazy = false,    -- make sure we load this during startup if it is your main colorscheme
  priority = 1000, -- make sure to load this before all the other start plugins
  config = function()
    -- load the colorscheme here
    vim.g.sonokai_enable_italic = true
    vim.g.sonokai_style = 'default'  -- Available styles: 'default', 'atlantis', 'andromeda', 'shusia', 'maia', 'espresso'
    vim.g.sonokai_disable_italic_comment = false  -- Disable italics in comments

    vim.cmd([[colorscheme sonokai]])
  end,

}
