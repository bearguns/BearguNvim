require('bearguns.defaults')
require('bearguns.keymaps')
require('bearguns.plugins')
require('bearguns.ui-settings')
require('bearguns.nvim-tree')
require('project')
require'lspconfig'.volar.setup{
  filetypes = {'typescript', 'vue'}
}
vim.g.neoformat_try_node_exe = 1
