require("harpoon").setup({
    menu = {
        width = vim.api.nvim_win_get_width(0) - 32,
    }
})
local mark = require('harpoon.mark')
local ui = require('harpoon.ui')

vim.keymap.set("n", "<leader>a", mark.add_file)
vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)



vim.keymap.set("n", "<C-h>", function() ui.nav_next() end)
vim.keymap.set("n", "<C-t>", function() ui.nav_prev() end)
