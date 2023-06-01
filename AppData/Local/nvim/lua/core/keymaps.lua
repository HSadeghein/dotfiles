
vim.g.mapleader = ' '
vim.keymap.set('n', '<C-n>', ':noh<CR>')
vim.keymap.set({'n', 'i'}, '<A-o>', ':ClangdSwitchSourceHeader<CR>')
