return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local telescope = require("telescope")
    telescope.setup({
      defaults = {
        path_display = { "truncate" },
      },
    })
    telescope.load_extension("fzf")
    local keymap = vim.keymap
    local builtin = require("telescope.builtin")
    keymap.set("n", "<leader>ff", builtin.find_files, {})
    keymap.set("n", "<leader>pf", builtin.git_files, {})
    keymap.set("n", "<leader>pg", builtin.live_grep, {})
    keymap.set("n", "<leader>bb", builtin.buffers, {})
  end,
}
