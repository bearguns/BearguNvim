vim.keymap.set("n", "<leader>dd", vim.cmd.Ex)
vim.keymap.set("i", "jk", "<Escape>")
vim.keymap.set("n", "<leader>ws", vim.cmd.split)
vim.keymap.set("n", "<leader>wv", vim.cmd.vsplit)
vim.keymap.set("n", "<leader>wh", ":wincmd h<cr>")
vim.keymap.set("n", "<leader>wj", ":wincmd j<cr>")
vim.keymap.set("n", "<leader>wk", ":wincmd k<cr>")
vim.keymap.set("n", "<leader>wl", ":wincmd l<cr>")
vim.keymap.set("n", "<leader>wo", ":only<cr>")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>y", "\"+Y")
