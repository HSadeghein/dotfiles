  

-- -- ***** maybe move them to another file for lspconfig
-- -- Use LspAttach autocommand to only map the following keys
-- -- after the language server attaches to the current buffer
-- vim.api.nvim_create_autocmd('LspAttach', {
--     group = vim.api.nvim_create_augroup('UserLspConfig', {}),
--     callback = function(ev)
--       -- Enable completion triggered by <c-x><c-o>
--       vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'
  
--       -- Buffer local mappings.
--       -- See `:help vim.lsp.*` for documentation on any of the below functions
--       local opts = { buffer = ev.buf }
--       vim.keymap.set({'n', 'v'}, '<space>fc', function() 
--           vim.lsp.buf.format{async = true}
--       end, opts)
--       vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
--       vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
--       vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
--       vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
--       vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
--       vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
--       vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
--       vim.keymap.set('n', '<space>wl', function()
--         print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
--       end, opts)
--       vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
--       vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
--       vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
--       -- vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
--       -- vim.keymap.set('n', '<space>fc', function()
--       --   vim.lsp.buf.format { async = true }
--       -- end, opts)
--     end,
--   })

vim.lsp.config.clangd = {
  cmd = { 'clangd', '--background-index',
            "--header-insertion=never",
            "--all-scopes-completion",
            "--compile-commands-dir=${workspaceFolder}/",
            "--pch-storage=memory",
            "--pretty",
            "--background-index",
            "--background-index-priority=normal",
            "--clang-tidy",
            "--enable-config",
            "-j=16"
},
  root_markers = { 'compile_commands.json', 'compile_flags.txt' },
  filetypes = { 'c', 'cpp', 'h' },
}


vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    if client:supports_method('textDocument/completion') then
      vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
    end

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

vim.cmd("set completeopt+=noselect")