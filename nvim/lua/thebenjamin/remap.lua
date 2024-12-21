vim.g.mapleader = ","
vim.wo.number = true
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("i", "kj", "<ESC>", { silent = true })
vim.keymap.set({ 'n', 'i' }, '<leader>w', '<ESC>:w<CR>')
vim.keymap.set('n', '<Enter>', 'o<Esc>', { desc = 'Insert line below' })
vim.keymap.set('n', '<S-Enter>', 'O<Esc>', { desc = 'Insert line above' })
vim.keymap.set('n', '<leader><space>', ':nohlsearch<CR>', { noremap = true, silent = true })
