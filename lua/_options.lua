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
require('kanagawa').setup({
    undercurl = true,
    commentStyle = { italic = true },
    functionStyle = {},
    keywordStyle = { italic = false},
    statementStyle = { bold = true },
    typeStyle = {},
    transparent = true,        -- do not set background color
    dimInactive = false,        -- dim inactive window `:h hl-NormalNC`
    globalStatus = false,       -- adjust window separators highlight for laststatus=3
    terminalColors = true,      -- define vim.g.terminal_color_{0,17}
    colors = {},
    overrides = {
        ['@method'] = { fg = "#FF9E3B"},
        ['@keyword.function'] = { fg = "#7E9CD8"},
        ['@variable'] = { fg = "#9CABCA"},
        ['@constructor'] = { fg = "#DCA561"},
        ['Visual'] = { bg = "#6A9589"},
    },
    theme = "default"           -- Load "default" theme or the experimental "light" theme
})
vim.o.background = "dark"
-- vim.cmd("colorscheme gruvbox")
vim.cmd("colorscheme kanagawa")

-- require('vscode').setup({
--     -- Enable transparent background
--     transparent = true,
--
--     -- Enable italic comment
--     italic_comments = true,
--
--     -- Disable nvim-tree background color
--     disable_nvimtree_bg = true,
--
--     -- Override colors (see ./lua/vscode/colors.lua)
--     color_overrides = {
--         vscLineNumber = '#FFFFFF',
--     },
-- })
