require("telescope").setup {
  defaults = {
    -- Your regular Telescope's options.
  },
  extensions = {
    recent_files = {
      -- This extension's options, see below.
      only_cwd = true
    }
  }
}

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>fb', function()
	builtin.buffers({sort_mru = true})
end)
vim.keymap.set('n', '<leader>fs', builtin.grep_string, {})
vim.keymap.set('n', '<leader>fe', builtin.diagnostics, {})
-- vim.keymap.set('n', '<leader>fs', function() 
--         builtin.grep_string({ search = vim.fn.input("Grep > ")})
-- end)
--
--
