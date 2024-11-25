vim.g.mapleader = ","
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("i", "jj", "<ESC>", { silent = true })
vim.keymap.set({ 'n', 'i' }, '<leader>w', '<ESC>:w<CR>')
