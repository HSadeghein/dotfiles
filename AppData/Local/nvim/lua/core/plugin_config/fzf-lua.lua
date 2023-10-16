local actions = require('fzf-lua.actions')

require('fzf-lua').setup({
  winopts = {
    hl = {
      border = 'FloatBorder',
    },
  },
  preview_layout = 'flex',
  flip_columns = 150,
  fzf_opts = {
    ['--border'] = 'none',
  },
  previewers = {
    builtin = {
      scrollbar = false,
    },
  },
  grep = {
    actions = {
      ['default'] = actions.file_edit_or_qf,
      ['ctrl-q'] = actions.file_sel_to_qf,
    },
  },
  buffers = {
    git_icons = false,
    actions = {
      ['ctrl-w'] = actions.buf_del,
      ['ctrl-q'] = actions.file_sel_to_qf,
    },
  },
  files = {
    fd_opts = [[--color never --type f --hidden --follow --strip-cwd-prefix]],
    git_icons = false,
    actions = {
      ['default'] = actions.file_edit,
      ['ctrl-q'] = actions.file_sel_to_qf,
    },
  },
  quickfix = {
    git_icons = false,
    actions = {
      ['default'] = actions.file_edit_or_qf,
      ['ctrl-q'] = actions.file_sel_to_qf,
    },
  },
  lsp = {
    async_or_timeout = false,
    severity = 'Warning',
    -- icons = {
    --   ['Error'] = { icon = vim.g.diagnostic_icons.Error, color = 'red' },
    --   ['Warning'] = { icon = vim.g.diagnostic_icons.Warning, color = 'yellow' },
    --   ['Information'] = { icon = vim.g.diagnostic_icons.Information, color = 'blue' },
    --   ['Hint'] = { icon = vim.g.diagnostic_icons.Hint, color = 'blue' },
    -- },
    actions = {
      ['default'] = actions.file_edit_or_qf,
      ['ctrl-q'] = actions.file_sel_to_qf,
    },
  },
})

vim.keymap.set("n", "<leader>ff",
  "<cmd>lua require('fzf-lua').files({cwd = 'C:\'})<CR>", { silent = true })


vim.keymap.set('n', '<leader>fg',
    "<cmd>lua require('fzf-lua').live_grep()<CR>", { silent = true })
-- vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>fb', "<cmd>lua require('fzf-lua').buffers()<CR>", { silent = true })
vim.keymap.set('n', '<leader>fs', "<cmd>lua require('fzf-lua').grep_cword()<CR>", { silent = true })
-- vim.keymap.set('n', '<leader>fe', builtin.diagnostics, {})

vim.keymap.set('n', 'gr', "<cmd>lua require('fzf-lua').lsp_references()<CR>", { silent = true })
-- vim.keymap.set('n', '<leader>fs', function() 
--         builtin.grep_string({ only_sort_text = true, search = vim.fn.input("Grep > " .. vim.fn.expand('<cword>'))})
-- end)

-- vim.keymap.set('n', '<leader>ft', builtin.treesitter, {})
