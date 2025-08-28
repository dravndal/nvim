-- Make line numbers default
vim.o.relativenumber = false
vim.opt.number = false
vim.o.belloff = "all"
vim.o.cmdheight = 1
vim.opt.statuscolumn = "%l  "
vim.o.winborder = "single"
vim.o.showmode = false
vim.o.clipboard = "unnamedplus"
vim.o.breakindent = true
vim.o.undofile = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.signcolumn = "no"
vim.o.updatetime = 250
vim.o.timeoutlen = 300
vim.o.splitright = true
vim.o.splitbelow = true
vim.o.scrolloff = 10
vim.opt.fillchars:append({ eob = " " })

vim.o.backup = false
vim.o.writebackup = false
vim.o.autoread = true
vim.o.backupcopy = "yes"
