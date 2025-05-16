return {
  "doki-theme/doki-theme-vim",
  lazy = false,
  priority = 1000, -- asegúrate de que cargue antes que otros
  config = function()
    vim.cmd("colorscheme rei") -- o cualquier otro, como zero_two_dark_rose
  end,
}
