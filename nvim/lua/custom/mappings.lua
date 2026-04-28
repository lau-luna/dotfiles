local M = {}

M.general = {
  n = {
    
    
    -- LiveServer con vim-preview
    ["<leader>pp"] = { "<cmd>MarkdownPreview<CR>", "Markdown Preview" },
    ["<leader>ps"] = { "<cmd>MarkdownPreviewStop<CR>", "Markdown Stop Preview" },
    
    -- Para HTML (necesita extensión)
    ["<leader>hp"] = { "<cmd>PreviewHTML<CR>", "HTML Preview" },

  }
}

return M
