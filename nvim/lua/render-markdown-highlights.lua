-- ~/.config/nvim/lua/render-markdown-highlights.lua

local function set_highlights()
  -- Headings fg
  vim.api.nvim_set_hl(0, "RenderMarkdownH1", { fg = "#F38BA8", bold = true })
  vim.api.nvim_set_hl(0, "RenderMarkdownH2", { fg = "#FAE3B0", bold = true })
  vim.api.nvim_set_hl(0, "RenderMarkdownH3", { fg = "#ABE9B3", bold = true })
  vim.api.nvim_set_hl(0, "RenderMarkdownH4", { fg = "#89B4FA", bold = true })
  vim.api.nvim_set_hl(0, "RenderMarkdownH5", { fg = "#d0a9e5", bold = true })
  vim.api.nvim_set_hl(0, "RenderMarkdownH6", { fg = "#B5E8E0", bold = true })

  -- Headings bg (banner full width)
  vim.api.nvim_set_hl(0, "RenderMarkdownH1Bg", { fg = "#F38BA8", bg = "#2d2c3c", bold = true })
  vim.api.nvim_set_hl(0, "RenderMarkdownH2Bg", { fg = "#FAE3B0", bg = "#2d2c3c", bold = true })
  vim.api.nvim_set_hl(0, "RenderMarkdownH3Bg", { fg = "#ABE9B3", bg = "#363545", bold = true })
  vim.api.nvim_set_hl(0, "RenderMarkdownH4Bg", { fg = "#89B4FA", bg = "#3e3d4d", bold = true })

  -- Code blocks
  vim.api.nvim_set_hl(0, "RenderMarkdownCode", { bg = "#252434" })
  vim.api.nvim_set_hl(0, "RenderMarkdownCodeBorder", { fg = "#474656" })
  vim.api.nvim_set_hl(0, "RenderMarkdownCodeInline", { fg = "#ABE9B3", bg = "#2d2c3c" })

  -- Bullets
  vim.api.nvim_set_hl(0, "RenderMarkdownBullet", { fg = "#F8BD96" })

  -- Callouts
  vim.api.nvim_set_hl(0, "RenderMarkdownInfo", { fg = "#89B4FA", bold = true })
  vim.api.nvim_set_hl(0, "RenderMarkdownSuccess", { fg = "#ABE9B3", bold = true })
  vim.api.nvim_set_hl(0, "RenderMarkdownWarn", { fg = "#FAE3B0", bold = true })
  vim.api.nvim_set_hl(0, "RenderMarkdownError", { fg = "#F38BA8", bold = true })

  -- Tablas
  vim.api.nvim_set_hl(0, "RenderMarkdownTableHead", { fg = "#89B4FA", bg = "#2d2c3c", bold = true })
  vim.api.nvim_set_hl(0, "RenderMarkdownTableRow", { fg = "#D9E0EE", bg = "#1E1D2D" })
  vim.api.nvim_set_hl(0, "RenderMarkdownDash", { fg = "#F38BA8" })
  vim.api.nvim_set_hl(0, "RenderMarkdownTableFill", { fg = "#F38BA8" })

vim.api.nvim_set_hl(0, "@punctuation.special.markdown", { fg = "#F38BA8" })
end

-- Aplicar después de que todo cargue (VimEnter es después de Base46)
vim.api.nvim_create_autocmd("VimEnter", {
  callback = set_highlights,
})

-- Re-aplicar si el colorscheme cambia
vim.api.nvim_create_autocmd("ColorScheme", {
  callback = set_highlights,
})
