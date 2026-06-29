local on_attach = function(_, bufnr)
  vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references, {
    buffer = bufnr,
    desc = "LSP references",
  })

  vim.keymap.set('n', 'K', vim.lsp.buf.hover, {
    buffer = bufnr,
    desc = "LSP hover",
  })

  vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, {
    buffer = bufnr,
    desc = "Go to type definition",
  })
end

require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = {
    "bashls",
    "clangd",
    "dockerls",
    "gopls",
    "jdtls",
    "jsonls",
    "lua_ls",
    "pyright",
    "rust_analyzer",
    "sqlls",
    "ts_ls",
    "yamlls",
    "zls",
  },
})

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    on_attach(nil, args.buf)
  end,
})

vim.diagnostic.config({
  virtual_text = true,
})

