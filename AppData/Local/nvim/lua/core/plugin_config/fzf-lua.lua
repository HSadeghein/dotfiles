-- local actions = require('fzf-lua.actions')

-- require('fzf-lua').setup({"telescope",winopts={preview={default="bat"}}})
-- require('fzf-lua').setup({'fzf-native'})

local actions = require("fzf-lua").actions
require('fzf-lua').setup({
    fzf_colors = true,
    hls = 
    {
        border = "FloatBorder",
        -- cursor       = 'Error',     -- cursor highlight
        cursorline   = 'Visual', -- cursor line highlight
    },
    -- buffers = {
    --     prompt            = 'Buffers❯ ',
    --     file_icons        = true,         -- show file icons (true|"devicons"|"mini")?
    --     color_icons       = true,         -- colorize file|git icons
    --     sort_lastused     = true,         -- sort buffers() by last used
    --     show_unloaded     = true,         -- show unloaded buffers
    --     cwd_only          = false,        -- buffers for the cwd only
    --     cwd               = nil,          -- buffers list for a given dir
    --     actions = {
    --         -- actions inherit from 'actions.files' and merge
    --         -- by supplying a table of functions we're telling
    --         -- fzf-lua to not close the fzf window, this way we
    --         -- can resume the buffers picker on the same window
    --         -- eliminating an otherwise unaesthetic win "flash"
    --         ["alt-c"]      = { fn = actions.buf_del, reload = true },
    --     }
    -- }
--   previewers = {
--       builtin = {
--         hl_cursor       = 'Error',     -- cursor highlight
--         hl_cursorline   = 'IncSearch', -- cursor line highlight
--       },
--   },
})

vim.keymap.set("n", "<leader>ff",
  "<cmd>lua require('fzf-lua').files()<CR>", { silent = true })


vim.keymap.set('n', '<leader>fg',
    "<cmd>lua require('fzf-lua').live_grep()<CR>", { silent = true })
-- vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>fb', "<cmd>lua require('fzf-lua').buffers()<CR>", { silent = true })
vim.keymap.set('n', '<leader>fs', "<cmd>lua require('fzf-lua').grep_cword()<CR>", { silent = true })
vim.keymap.set('n', 'gr', "<cmd>lua require('fzf-lua').lsp_references()<CR>", { silent = true })
vim.keymap.set('n', '<leader>ca', "<cmd>lua require('fzf-lua').lsp_code_actions()<CR>", { silent = true })
vim.keymap.set('n', '<leader>fe', "<cmd>lua require('fzf-lua').diagnostics_workspace()<CR>", { silent = true })
vim.keymap.set('n', '<leader><leader>', "<cmd>lua require('fzf-lua').oldfiles()<CR>", { silent = true })
-- vim.keymap.set('n', '<leader>fe', builtin.diagnostics, {})

-- vim.keymap.set('n', 'gr', "<cmd>lua require('fzf-lua').lsp_references()<CR>", { silent = true })
-- vim.keymap.set('n', '<leader>fs', function() 
--         builtin.grep_string({ only_sort_text = true, search = vim.fn.input("Grep > " .. vim.fn.expand('<cword>'))})
-- end)

-- vim.keymap.set('n', '<leader>ft', builtin.treesitter, {})
