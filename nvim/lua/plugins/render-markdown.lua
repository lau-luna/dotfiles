return {
  'MeanderingProgrammer/render-markdown.nvim',
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    'echasnovski/mini.nvim',
  },
  ft = { 'markdown', 'quarto' },

  opts = {

    anti_conceal = { enabled = true },
    overrides = {
      buftype = {},
      filetype = {},
    },
    render_modes = { 'n', 'c', 't' },
    treesitter = {
      enabled = false, -- render-markdown maneja los highlights
    },
    latex = {
      enabled = true,
      converter = { 'utftex', 'latex2text' },
      highlight = 'RenderMarkdownMath',
      position = 'center',
      top_pad = 0,
      bottom_pad = 0,
    },

    heading = {
      sign = false,
      width = "full",
      icons = { "󰲡 ", "󰲣 ", "󰲥 ", "󰲧 ", "󰲩 ", "󰲫 " },
    },
    code = {
      sign = false,
      width = "block",
      right_pad = 1,
      highlight = "RenderMarkdownCode", -- <-- agregar esto
    },
    dash = { width = 70 },
    bullet = {
      icons = { "●", "○", "◆", "◇" },
    },
    checkbox = {
      unchecked = { icon = "󰄱 " },
      checked   = { icon = "󰱒 " },
    },
    pipe_table = {
      style               = "full",
      cell                = "padded",
      min_width           = 0,
      border              = {
        "┌", "┬", "┐",
        "├", "┼", "┤",
        "└", "┴", "┘",
        "│", "─",
      },
      alignment_indicator = "━",
      head                = "RenderMarkdownTableHead",
      row                 = "RenderMarkdownTableRow",
      filler              = "RenderMarkdownTableFill",
    },
  },


}
