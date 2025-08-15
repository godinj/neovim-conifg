return {
  "iamcco/markdown-preview.nvim",
  -- Be sure to `cd ~/.local/share/nvim/lazy/markdown-preview.nvim && npm install`
  cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
  build = "cd app && yarn install",
  init = function()
    vim.g.mkdp_filetypes = { "markdown" }
  end,
  ft = { "markdown" },
} 
