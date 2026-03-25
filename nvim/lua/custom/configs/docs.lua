return {
  plugins = {
    {
      "kkoomen/vim-doge", -- Generador de documentación
      run = ":call doge#install()"
    },
    {
      "danymat/neogen", -- Otro generador de documentación
      config = function()
        require('neogen').setup()
      end
    }
  }
}
