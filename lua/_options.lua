-- ALL OPTIONS GO IN THIS FILE
--
--Set highlight on search
vim.o.hlsearch = false

--Backspace behavior
vim.opt.backspace = [[indent,eol,start]]

--Make line numbers default
vim.wo.number = true

--Make relative linenumbers
vim.wo.relativenumber = true

--Enable mouse mode
vim.o.mouse = 'a'

--Enable UTF-8
vim.o.encoding = 'utf-8'

-- Set indent options for vim
vim.opt.title = true
vim.opt.wrap = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.showbreak = [[↪ ]]
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.breakindent = true
vim.opt.linebreak = true
vim.opt.smartindent = true

--Save undo history
vim.opt.undofile = true

--Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

--Decrease update time
vim.o.updatetime = 100
vim.wo.signcolumn = 'yes'

vim.opt.scrolloff = 10
vim.opt.swapfile = false

--Set colorscheme
vim.opt.termguicolors = true;

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noinsert,noselect'

vim.opt.signcolumn = "yes";
vim.opt.hidden = true;
vim.opt.incsearch = true;
vim.opt.cursorline = true;
vim.opt.cmdheight = 0;
vim.opt.clipboard = "unnamedplus";
vim.opt.pumheight = 10;
vim.o.splitbelow = true;
vim.o.splitright = true;

-- Lua
-- vim.g.tokyodark_color_gamma = "0.8"
vim.cmd[[colorscheme noctis]]

--Indents
-- vim.cmd([[ autocmd FileType javascript setlocal shiftwidth=2 tabstop=2 softtabstop=2 ]])
vim.cmd([[ autocmd FileType lua setlocal shiftwidth=4 tabstop=4 softtabstop=4 ]])
-- vim.cmd([[ autocmd FileType typescript setlocal shiftwidth=2 tabstop=2 softtabstop=2 ]])
-- vim.cmd([[ autocmd FileType php setlocal shiftwidth=4 tabstop=4 softtabstop=4 ]])
-- vim.cmd([[ autocmd FileType scss setlocal shiftwidth=2 tabstop=2 softtabstop=2 ]])
-- vim.cmd([[ autocmd FileType css setlocal shiftwidth=2 tabstop=2 softtabstop=2 ]])
-- vim.cmd([[ autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o ]])
