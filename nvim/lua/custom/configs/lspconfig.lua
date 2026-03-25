local on_attach = function(client, bufnr)
  -- ... configuraciones existentes
  
  -- Formatear al guardar
  vim.api.nvim_create_autocmd("BufWritePre", {
    buffer = bufnr,
    callback = function()
      vim.lsp.buf.format()
    end,
  })
end
