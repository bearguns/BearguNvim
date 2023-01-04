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
    use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
    use("theprimeagen/harpoon")
    use("mbbill/undotree")
    use("TimUntersberger/neogit")
    use {
        'VonHeikemen/lsp-zero.nvim',
        requires = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},
            {'williamboman/mason.nvim'},
            {'williamboman/mason-lspconfig.nvim'},

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},
            {'hrsh7th/cmp-buffer'},
            {'hrsh7th/cmp-path'},
            {'saadparwaiz1/cmp_luasnip'},
            {'hrsh7th/cmp-nvim-lsp'},
            {'hrsh7th/cmp-nvim-lua'},

            -- Snippets
            {'L3MON4D3/LuaSnip'},
            {'rafamadriz/friendly-snippets'},
        }
    }
    use("windwp/nvim-autopairs")
    use("editorconfig/editorconfig-vim")
    use {"jesseleite/nvim-noirbuddy", requires = { "tjdevries/colorbuddy.nvim", branch = "dev" } }
end)

