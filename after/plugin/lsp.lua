local lsp = require("lsp-zero")

lsp.preset("recommended")
lsp.ensure_installed({
	"tsserver",
	"eslint",
	"emmet_ls",
	"sumneko_lua",
	"volar"
})

local cmp = require("cmp")
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
	["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
	["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
	["<CR>"] = cmp.mapping.confirm({ select = false }),
	["<C-Space>"] = cmp.mapping.complete(),
})

lsp.setup_nvim_cmp({
	mapping = cmp_mappings,
	preselect = cmp.PreselectMode.None,
})

lsp.nvim_workspace({
  library = vim.api.nvim_get_runtime_file('', true)
})

lsp.on_attach(function(client, bufnr)
	local opts = {buffer = bufnr, remap = false}
	vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end)
	vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end)
	vim.keymap.set("n", "gl", function() vim.diagnostic.open_float({ border = "rounded" }) end)
	vim.keymap.set("n", "gs", function() vim.lsp.buf.signature_help() end)
	vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end)
	vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end)
end)

lsp.configure("sumneko_lua", {
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" }
			},
			workspace = {
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,

				}
			},
		}
	}
})

lsp.setup()
