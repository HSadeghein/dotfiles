  

-- ***** maybe move them to another file for lspconfig
-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(ev)
      -- Enable completion triggered by <c-x><c-o>
      vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'
  
      -- Buffer local mappings.
      -- See `:help vim.lsp.*` for documentation on any of the below functions
      local opts = { buffer = ev.buf }
      vim.keymap.set({'n', 'v'}, '<space>fc', function() 
          vim.lsp.buf.format{async = true}
      end, opts)
      vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
      vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
      vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
      vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
      vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
      vim.keymap.set('n', '<space>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
      end, opts)
      vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
      vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
      vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
      -- vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
      -- vim.keymap.set('n', '<space>fc', function()
      --   vim.lsp.buf.format { async = true }
      -- end, opts)
    end,
  })

--   local coq = require 'coq'
--   -- Set up lspconfig.
--   -- local capabilities = require('cmp_nvim_lsp').default_capabilities()
--   -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
--   require('lspconfig')['clangd'].setup(coq.lsp_ensure_capabilities({
--     cmd = {
--         "clangd",
--         "--header-insertion=never",
--         "--pch-storage=memory",
--         "--background-index",
--         "--clang-tidy",
--         "--completion-style=detailed"
--         }
--     }
-- ))
