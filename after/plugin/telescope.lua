local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>pf", builtin.git_files, {})
vim.keymap.set("n", "<leader>pg", builtin.live_grep, {})
