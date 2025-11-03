local opts = { noremap = true, silent = true }

vim.keymap.set('n', '<C-J>', '<C-W><C-J>', opts)
vim.keymap.set('n', '<C-K>', '<C-W><C-K>', opts)
vim.keymap.set('n', '<C-L>', '<C-W><C-L>', opts)
vim.keymap.set('n', '<C-H>', '<C-W><C-H>', opts)

vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

vim.keymap.set('n', '<leader>e', ':Vexplore<CR>', opts)
