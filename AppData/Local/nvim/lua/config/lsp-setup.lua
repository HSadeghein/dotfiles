
vim.lsp.enable({
  "clangd"
})
---[[AUTOCOMPLETION SETUP
vim.o.completeopt = "menu,noinsert,popup,fuzzy"

---[[ Setup keymaps so we can accept completion using Enter and choose items using arrow keys or Tab.
local pumMaps = {
  ['<Tab>'] = '<C-n>',
  ['<S-Tab>'] = '<C-p>',
  ['<Down>'] = '<C-n>',
  ['<Up>'] = '<C-p>',
  ['<CR>'] = '<C-y>',
}
for insertKmap, pumKmap in pairs(pumMaps) do
  vim.keymap.set('i', insertKmap, function()
    return vim.fn.pumvisible() == 1 and pumKmap or insertKmap
  end, { expr = true })
end
---]]

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    ---[[Code required to activate autocompletion and trigger it on each keypress
    local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
    client.server_capabilities.completionProvider.triggerCharacters = vim.split("qwertyuiopasdfghjklzxcvbnm. ", "")
    vim.api.nvim_create_autocmd({ 'TextChangedI' }, {
      buffer = args.buf,
      callback = function()
        vim.lsp.completion.get()
      end
    })
    vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
    ---]]

      local opts = { buffer = args.buf }
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
      vim.keymap.set('n', '<space>r', vim.lsp.buf.rename, opts)
      vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
      -- vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
      -- vim.keymap.set('n', '<space>fc', function()
      --   vim.lsp.buf.format { async = true }
      -- end, opts)

    ---[[Code required to add documentation popup for an item
    -- local _, cancel_prev = nil, function() end
    -- vim.api.nvim_create_autocmd('CompleteChanged', {
    --   buffer = args.buf,
    --   callback = function()
    --     cancel_prev()
    --     local info = vim.fn.complete_info({ 'selected' })
    --     local completionItem = vim.tbl_get(vim.v.completed_item, 'user_data', 'nvim', 'lsp', 'completion_item')
    --     if nil == completionItem then
    --       return
    --     end
    --     _, cancel_prev = vim.lsp.buf_request(args.buf,
    --       vim.lsp.protocol.Methods.completionItem_resolve,
    --       completionItem,
    --       function(err, item, ctx)
    --         if not item then
    --           return
    --         end
    --         local docs = (item.documentation or {}).value
    --         local win = vim.api.nvim__complete_set(info['selected'], { info = docs })
    --         if win.winid and vim.api.nvim_win_is_valid(win.winid) then
    --           vim.treesitter.start(win.bufnr, 'markdown')
    --           vim.wo[win.winid].conceallevel = 3
    --         end
    --       end)
    --   end
    -- })
    ---]]
  end
})
---AUTOCOMPLETION SETUP END]]