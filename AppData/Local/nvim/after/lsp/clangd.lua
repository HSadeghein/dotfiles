  

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



local has_words_before = function()
  unpack = unpack or table.unpack
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end


local ELLIPSIS_CHAR = '…'
local MAX_LABEL_WIDTH = 25
local MAX_KIND_WIDTH = 14

local get_ws = function (max, len)
  return (" "):rep(max - len)
end

local format = function(_, item)
  local content = item.abbr
  -- local kind_symbol = symbols[item.kind]
  -- item.kind = kind_symbol .. get_ws(MAX_KIND_WIDTH, #kind_symbol)

  if #content > MAX_LABEL_WIDTH then
    item.abbr = vim.fn.strcharpart(content, 0, MAX_LABEL_WIDTH) .. ELLIPSIS_CHAR
  else
    item.abbr = content .. get_ws(MAX_LABEL_WIDTH, #content)
  end

  return item
end


--   local luasnip = require("luasnip")
--   -- Set up nvim-cmp.
--   local cmp = require'cmp'

--   cmp.setup({
--     sorting = {
--         comparators = {
--             cmp.config.compare.recently_used,
--             -- cmp.config.compare.kind,
--             -- cmp.config.compare.exact,
--             -- cmp.config.compare.offset,
--             -- require("clangd_extensions.cmp_scores"),
--             -- cmp.config.compare.sort_text,
--             -- cmp.config.compare.length,
--             -- cmp.config.compare.order,
--         },
--     },

--     formatting = {
--         format = format
--     },

--     snippet = {
--       -- REQUIRED - you must specify a snippet engine
--       expand = function(args)
--         -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
--         luasnip.lsp_expand(args.body) -- For `luasnip` users.
--         -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
--         -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
--       end,
--     },
--     window = {
--       -- completion = cmp.config.window.bordered(),
--       documentation = cmp.config.window.bordered(),
--     },
--     -- [[ mapping ]] = require("core.mappings").cmp(),
--     mapping = cmp.mapping.preset.insert({
--       ['<C-b>'] = cmp.mapping.scroll_docs(-4),
--       ['<C-f>'] = cmp.mapping.scroll_docs(4),
--       ['<C-Space>'] = cmp.mapping.complete(),
--       ['<C-e>'] = cmp.mapping.abort(),
--       ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
--     ["<Tab>"] = cmp.mapping(function(fallback)
--           if cmp.visible() then
--             cmp.select_next_item()
--           -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable() 
--           -- they way you will only jump inside the snippet region
--           -- elseif luasnip.expand_or_locally_jumpable() then
--           --   luasnip.expand_or_jump()
--           elseif has_words_before() then
--             cmp.complete()
--           else
--             fallback()
--           end
--         end, { "i", "s" }),

--         ["<S-Tab>"] = cmp.mapping(function(fallback)
--           if cmp.visible() then
--             cmp.select_prev_item()
--           -- elseif luasnip.jumpable(-1) then
--           --   luasnip.jump(-1)
--           else
--             fallback()
--           end
--         end, { "i", "s" }),
--     }),
--     sources = cmp.config.sources({
--       { name = 'nvim_lsp' },
--       { name = 'nvim_lsp_signature_help'},
--       -- { name = 'vsnip' }, -- For vsnip users.
--       { name = 'luasnip' }, -- For luasnip users.
--       -- { name = 'ultisnips' }, -- For ultisnips users.
--       -- { name = 'snippy' }, -- For snippy users.
--       { name = 'buffer' },
--       { name = "nvim_lua" },
--       { name = "path"},
--     })
--   })

--   -- Set configuration for specific filetype.
--   cmp.setup.filetype('gitcommit', {
--     sources = cmp.config.sources({
--       { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
--     }, {
--       { name = 'buffer' },
--     })
--   })

--   -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
--   cmp.setup.cmdline({ '/', '?' }, {
--     mapping = cmp.mapping.preset.cmdline(),
--     sources = {
--       { name = 'buffer' }
--     }
--   })

--   -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
--   cmp.setup.cmdline(':', {
--     mapping = cmp.mapping.preset.cmdline(),
--     sources = cmp.config.sources({
--       { name = 'path' }
--     }, {
--       { name = 'cmdline' }
--     })
--   })


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

    ---[[Code required to add documentation popup for an item
    local _, cancel_prev = nil, function() end
    vim.api.nvim_create_autocmd('CompleteChanged', {
      buffer = args.buf,
      callback = function()
        cancel_prev()
        local info = vim.fn.complete_info({ 'selected' })
        local completionItem = vim.tbl_get(vim.v.completed_item, 'user_data', 'nvim', 'lsp', 'completion_item')
        if nil == completionItem then
          return
        end
        _, cancel_prev = vim.lsp.buf_request(args.buf,
          vim.lsp.protocol.Methods.completionItem_resolve,
          completionItem,
          function(err, item, ctx)
            if not item then
              return
            end
            local docs = (item.documentation or {}).value
            local win = vim.api.nvim__complete_set(info['selected'], { info = docs })
            if win.winid and vim.api.nvim_win_is_valid(win.winid) then
              vim.treesitter.start(win.bufnr, 'markdown')
              vim.wo[win.winid].conceallevel = 3
            end
          end)
      end
    })
    ---]]
  end
})
---AUTOCOMPLETION SETUP END]]


-- local capabilities = require('cmp_nvim_lsp').default_capabilities()
return {
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

-- vim.lsp.enable({'clangd'})
