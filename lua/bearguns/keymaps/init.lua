local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Our two most important bindings
vim.g.mapleader = " "
map("i", "jk", "<Esc>", opts)

-- File actions
map("n", "<leader>ff", ":Telescope find_files<cr>", opts)
map("n", "<leader>fs", ":w<cr>", opts)
map("n", "<leader>ft", ":NvimTreeToggle<cr>", opts)
-- Buffer actions
map("n", "<leader>bb", ":Telescope buffers<cr>", opts)
map("n", "<leader>bp", ":bprevious<cr>", opts)
map("n", "<leader>bn", ":bnext<cr>", opts)
