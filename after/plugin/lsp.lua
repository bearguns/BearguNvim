require("mason").setup()
local mason_lspconfig = require("mason-lspconfig")
mason_lspconfig.setup({
    ensure_installed = {
        "volar",
        "emmet_ls",
        "sumneko_lua",
        "eslint",
    }
})

local cmp = require("cmp")
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_autopairs = require("nvim-autopairs.completion.cmp")
cmp.event:on(
    "confirm_done",
    cmp_autopairs.on_confirm_done()
)
local cmp_mappings = {
    ["<Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
            cmp.select_next_item()
        else
            fallback()
        end
    end),
    ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
    ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
    ["<CR>"] = cmp.mapping.confirm({ select = false }),
    ["<C-Space>"] = cmp.mapping.complete(),
}

cmp.setup({
    snippet = {
        expand = function(args)
            require("luasnip").lsp_expand(args.body)
        end,
    },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert(cmp_mappings),
    sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "buffer" },
        { name = "luasnip" },
    })
})

local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()
local lsp_attach = function(client, bufnr)
    local opts = {buffer = bufnr, remap = false}
    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end)
    vim.keymap.set("n", "ga", function() vim.lsp.buf.code_action() end)
    vim.keymap.set("n", "gl", function() vim.diagnostic.open_float({ border = "rounded" }) end)
    vim.keymap.set("n", "gs", function() vim.lsp.buf.signature_help() end)
    vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end)
    vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end)
end

local lsp = require("lspconfig")
mason_lspconfig.setup_handlers({
    function(server_name)
        lsp[server_name].setup({
            on_attach = lsp_attach,
            capabilities = lsp_capabilities
        })
    end,
    ["volar"] = function()
        lsp.volar.setup({
            filetypes = {'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'json'},
            on_attach = lsp_attach,
            capabilities = lsp_capabilities
        })
        require("luasnip.loaders.from_vscode").lazy_load({
            include = { "vue", "typescript", "javascript" }
        })
    end,
    ["eslint"] = function()
        lsp.eslint.setup({
            on_attach = lsp_attach,
            capabilities = lsp_capabilities,
            filetypes = {
                "javascript",
                "typescript",
                "typescriptreact",
                "vue",
                "json"
            },
            settings = {
                codeActionOnSave = {
                    enable = true,
                    mode = "all"
                }
            }
        })
    end,
    ["emmet_ls"] = function()
       lsp.emmet_ls.setup({
            on_attach = lsp_attach,
            capabilities = lsp_capabilities,
            filetypes = { "vue", "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "eruby" }
        })
    end
})

