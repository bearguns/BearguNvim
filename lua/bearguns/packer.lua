vim.cmd("packadd packer.nvim")
return require("packer").startup(function(use)
    -- Packer can manage itself
    use "wbthomason/packer.nvim"
    use {
        "nvim-telescope/telescope.nvim", tag = "0.1.0",
        requires = { {"nvim-lua/plenary.nvim"} }
    }
    use {
        "rose-pine/neovim",
        as = "rose-pine"
    }
    use("nvim-tree/nvim-web-devicons")
    use("nvim-treesitter/nvim-treesitter", {run = ":TSUpdate"})
    use("theprimeagen/harpoon")
    use("mbbill/undotree")
    use("TimUntersberger/neogit")
    -- LSP Support
    use{"neovim/nvim-lspconfig"}
    use{"williamboman/mason.nvim"}
    use{"williamboman/mason-lspconfig.nvim"}

    -- Autocompletion
    use{"hrsh7th/nvim-cmp"}
    use{"hrsh7th/cmp-buffer"}
    use{"hrsh7th/cmp-path"}
    use{"saadparwaiz1/cmp_luasnip"}
    use{"hrsh7th/cmp-nvim-lsp"}
    use{"hrsh7th/cmp-nvim-lua"}

    -- Snippets
    use{"L3MON4D3/LuaSnip"}
    use{"rafamadriz/friendly-snippets"}

    use("windwp/nvim-autopairs")
    use("editorconfig/editorconfig-vim")
    use {"jesseleite/nvim-noirbuddy", requires = { "tjdevries/colorbuddy.nvim", branch = "dev" } }
    use({"sbdchd/neoformat", as = "neoformat"})
end)

