vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.api.nvim_set_keymap('', '<Space>', '<Nop>', { noremap = true, silent = true })

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25

vim.opt.incsearch = true
vim.wo.relativenumber = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"

vim.opt.updatetime = 50

vim.opt.smartindent = true

vim.o.expandtab = true
vim.o.softtabstop = 2
vim.o.shiftwidth = 2

vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
vim.keymap.set("n", "Q", "<nop>")
