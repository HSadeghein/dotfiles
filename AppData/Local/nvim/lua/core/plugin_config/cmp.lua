  -- Set up lspconfig.
  local capabilities = require('cmp_nvim_lsp').default_capabilities()
  -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
  require('lspconfig')['clangd'].setup {
    capabilities = capabilities,
    cmd = {
        "clangd",
        "--j=8",
        "--header-insertion=never",
        "--pch-storage=memory",
        "--background-index",
        "--clang-tidy",
        "--completion-style=detailed"
    },
    -- filetypes = 
    -- {
    --     "c",
    --     "cpp",
    --     "hlsl"
    -- }

  }
require('lspconfig')['slangd'].setup{}
-- local navic = require("nvim-navic")
--
-- require("lspconfig").clangd.setup {
--     on_attach = function(client, bufnr)
--         navic.attach(client, bufnr)
--     end
-- }
