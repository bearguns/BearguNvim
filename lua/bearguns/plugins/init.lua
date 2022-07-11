return require('packer').startup(function()
  use 'wbthomason/packer.nvim'
  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use {
    "ahmedkhalf/project.nvim",
    config = function()
      require("project_nvim").setup {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
      }
    end
  }
  use 'neovim/nvim-lspconfig'
  use 'sbdchd/neoformat'
  use 'TimUntersberger/neogit'
  use 'kyazdani42/nvim-tree.lua'
  use 'kyazdani42/nvim-web-devicons'
  use 'EdenEast/nightfox.nvim'
end)
