return {
  'iamcco/markdown-preview.nvim',
  cmd = {'MarkdownPreview', 'MarkdownPreviewStop', 'MarkdownPreviewToggle' },
  build = 'cd app && yarn install',
  --only in markdown files
  ft = 'markdown',
  config = function()
    vim.g.mkdp_filetypes = { 'markdown' }
  end
}
