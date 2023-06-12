
vim.g.mapleader = ' '
vim.keymap.set('n', '<leader>n', ':noh<CR>')
vim.keymap.set({'n', 'i'}, '<leader>o', ':ClangdSwitchSourceHeader<CR>')
