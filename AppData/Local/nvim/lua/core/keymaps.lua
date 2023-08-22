
vim.g.mapleader = ' '
vim.keymap.set('n', '<leader>n', ':noh<CR>')
vim.keymap.set('n', '<A-o>', ':ClangdSwitchSourceHeader<CR>')
vim.keymap.set('n', '<leader>o', ':ClangdSwitchSourceHeader<CR>')
vim.keymap.set({'n'}, '<leader>q', ':x!<CR>')
vim.keymap.set('n', '<A-]>', ':vertical resize +5<CR>')
vim.keymap.set('n', '<A-[>', ':vertical resize -5<CR>')
vim.keymap.set('n', '<C-n>', ':NvimTreeFindFileToggle<CR>')
-- vim.keymap.set('n', '<A-p>', ':GetCurrentFunctions<CR>')
vim.keymap.set('n', '<A-p>', ':SymbolsOutline<CR>')
-- vim.keymap.set("n", "<leader>rn", function()
--   return ":IncRename " .. vim.fn.expand("<cword>")
-- end, { expr = true })
-- vim.keymap.set("n", "<leader>r", ":IncRename ")
vim.keymap.set("n", "<C-s>", ":w!<CR>")
vim.keymap.set("n", "<A-Up>", ":m-2<CR>")
vim.keymap.set("n", "<A-Down>", ":m+<CR>")
-- vim.keymap.set("n", "<Tab>", ":tabnext<CR>")
-- vim.keymap.set("n", "<S-Tab>", ":tabprevious<CR>")
-- Map a shortcut to open the picker.
vim.api.nvim_set_keymap("n", "<Leader><Leader>",
  [[<cmd>lua require('telescope').extensions.recent_files.pick()<CR>]],
  {noremap = true, silent = true})

vim.keymap.set("n", "<leader>ll", function()
    require('telescope-tabs').list_tabs()
end)
