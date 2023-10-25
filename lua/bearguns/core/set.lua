local opt = vim.opt
local g = vim.g

g.mapleader = " "
opt.guicursor = ""
opt.nu = true
opt.relativenumber = true

-- Tabs v Spaces
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = true

-- Lines and indentation
opt.smartindent = true
opt.wrap = false
opt.backspace = "indent,eol,start"

-- UI Basics
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

-- Let me copypasta freely
opt.clipboard:append("unnamedplus")
opt.scrolloff = 8
opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"

-- Searching
opt.hlsearch = false
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true

-- New splits right or below so cursor "lands" in split window
opt.splitright = true
opt.splitbelow = true

opt.updatetime = 50
