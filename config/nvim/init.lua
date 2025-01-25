vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = false
vim.opt.wrap = false
vim.opt.clipboard:append { 'unnamedplus' }
vim.opt.undofile = true
vim.opt.undodir = "/tmp"
vim.opt.termguicolors = true
vim.opt.showtabline = 1

vim.g.completeopt = { "menu", "menuon", "noselect" }
vim.g.mapleader = " "
vim.g.background = "dark"

vim.keymap.set('t', '<Esc>', '<C-\\><C-n>')
vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv')
