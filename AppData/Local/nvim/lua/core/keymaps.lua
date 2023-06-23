
vim.g.mapleader = ' '
vim.keymap.set('n', '<leader>n', ':noh<CR>')
vim.keymap.set({'n', 'i'}, '<leader>o', ':ClangdSwitchSourceHeader<CR>')
vim.keymap.set({'n'}, '<leader>q', ':x<CR>')
vim.keymap.set('n', '<A-]>', ':vertical resize +5<CR>')
vim.keymap.set('n', '<A-[>', ':vertical resize -5<CR>')
vim.keymap.set('n', '<C-n>', ':NvimTreeFindFileToggle<CR>')