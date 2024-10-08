return {
  "stevearc/conform.nvim",
  lazy = true,
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local conform = require("conform")
    conform.setup({
      formatters_by_ft = {
        javascript = { "prettier" },
        typescript = { "prettier" },
        css = { "prettier" },
        html = { "prettier" },
        json = { "prettier" },
        yaml = { "prettier" },
        lua = { "stylua" },
        vue = { "prettier" },
      },
      format_on_save = {
        -- lsp_fallback = true,
        async = false,
        timeout_ms = 1000,
      },
      log_level = vim.log.levels.DEBUG,
    })

    vim.keymap.set({ "n", "v" }, "<leader>T", function()
      conform.format({
        lsp_fallback = true,
        async = false,
        timeout_ms = 1000,
      })
    end, { desc = "Format file or range" })
  end,
}
