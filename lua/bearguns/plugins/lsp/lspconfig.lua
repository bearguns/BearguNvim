return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    { "antosha417/nvim-lsp-file-operations", config = true },
  },
  config = function()
    local lspconfig = require("lspconfig")
    local cmp_nvim_lsp = require("cmp_nvim_lsp")
    local keymap = vim.keymap
    local opts = { noremap = true, silent = true }

    local on_attach = function(client, bufnr)
      opts.buffer = bufnr

      opts.desc = "Show documentation for thing at point"
      keymap.set("n", "K", "<cmd>Lspsaga hover_doc ++quiet<CR>", opts)

      opts.desc = "Show line diagnostics"
      keymap.set("n", "gl", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)

      opts.desc = "Show LSP definitions"
      keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)

      opts.desc = "Show LSP references"
      keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts)

      opts.desc = "Go to declaration"
      keymap.set("n", "gD", vim.lsp.buf.declaration, opts)

      opts.desc = "Show LSP implementations"
      keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)

      opts.desc = "Show available code actions"
      keymap.set("n", "ga", "<cmd>Lspsaga code_action<CR>", opts)

      opts.desc = "LSP Rename"
      keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

      opts.desc = "Show buffer diagnostics"
      keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)

      opts.desc = "Show LSP signature help"
      keymap.set("n", "gs", vim.lsp.buf.signature_help, opts)

      opts.desc = "Restart LSP"
      keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts)
    end

    local capabilities = cmp_nvim_lsp.default_capabilities()
    lspconfig["lua_ls"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim" },
          },
          workspace = {
            library = {
              [vim.fn.expand("$VIMRUNTIME/lua")] = true,
              [vim.fn.stdpath("config") .. "lua"] = true,
            },
          },
        },
      },
    })

    lspconfig["emmet_ls"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
      filetypes = { "html", "css", "sass", "scss", "vue" },
    })

    lspconfig["eslint"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
      filetypes = { "vue", "typescript", "javascript" },
    })

    local mason_registry = require("mason-registry")
    local vue_language_server_path = mason_registry.get_package("vue-language-server"):get_install_path()
      .. "/node_modules/@vue/language-server"
    lspconfig.ts_ls.setup({
      capabilities = capabilities,
      on_attach = function(client, bfnr)
        on_attach(client, bfnr)
      end,

      init_options = {
        plugins = {
          {
            name = "@vue/typescript-plugin",
            location = vue_language_server_path,
            languages = { "vue" },
          },
        },
      },
      filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
    })
    -- lspconfig.tsserver.setup {}
    -- lspconfig.volar.setup({
    --   filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
    --   on_attach = function(client, bufnr)
    --     on_attach(client, bufnr)
    --   end,
    --   init_options = {
    --     vue = {
    --       hybridMode = false,
    --     },
    --   },
    -- })

    lspconfig["tailwindcss"].setup({
      capabilities = capabilities,
      on_attach = function(client, bufnr)
        on_attach(client, bufnr)
        require("tailwind-highlight").setup(client, bufnr, {
          single_column = false,
          mode = "background",
          debounce = 100,
        })
      end,
    })

    lspconfig["html"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    lspconfig["cssls"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })
  end,
}
