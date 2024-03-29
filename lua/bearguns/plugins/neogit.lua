return {
  "NeogitOrg/neogit",
  dependencies = {
    "nvim-lua/plenary.nvim", -- required
    "nvim-telescope/telescope.nvim", -- optional
    "sindrets/diffview.nvim", -- optional
    "ibhagwan/fzf-lua", -- optional
  },
  config = function()
    require("neogit").setup()
    vim.keymap.set("n", "<leader>gs", vim.cmd.Neogit)
  end,
}
