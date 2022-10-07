-- ALL KEYMAPS GO IN THIS FILE
--
--Remap space as leader key
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

--Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

--General keymaps
vim.keymap.set('n', '<C-q>', ':q!<CR>')
vim.keymap.set('n', '<A-q>', ':bd<CR>')
vim.keymap.set('n', '<C-P>', ':call PhpDocSingle()<CR>')
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('n', '<F10>', ':TransparentToggle<CR>')

--For moving lines up and down
vim.keymap.set('v', '<C-J>', ':m \'>+1<CR>gv=gv')
vim.keymap.set('v', '<C-K>', ':m \'>-2<CR>gv=gv')
vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv')
vim.keymap.set('v', '<C-P>', ':call PhpDocRange()<CR>')

-- Search/replace 
vim.keymap.set('n', '<c-w><c-r>', ':%s/<c-r><c-w>//g<left><left>')
vim.keymap.set('n', 'rn', ':%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>')

-- Clipboard
vim.keymap.set('n', '<leader>y', '\"+y')
vim.keymap.set('v', '<leader>y', '\"+y')
vim.keymap.set('n', '<leader>Y', 'gg\"+yG')

-- Yank "functions"
vim.keymap.set('n', 'yb', 'vi]y')
vim.keymap.set('n', 'yp', 'vi)y')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist)

-- Fugitive
vim.keymap.set('n', '<leader>gl', ':Gclog!<CR>')
vim.keymap.set('n', '<leader>gg', ':G<CR>')
vim.keymap.set('n', '<leader>gC', 'BCommits<CR>')
vim.keymap.set('n', '<leader>gb', ':Git blame<CR>')
vim.keymap.set('n', '<leader>gd', ':Gvdiffsplit<CR>')
vim.keymap.set('n', '<leader>ga', ':Git fetch --all<CR>')


-- Telescope
vim.keymap.set('n', '<leader><space>', function()
        require('telescope.builtin').find_files { previewer = false, hidden = true }
end)
vim.keymap.set('n', '<leader>ff', require('telescope.builtin').current_buffer_fuzzy_find)
vim.keymap.set('n', '<leader>h', require('telescope.builtin').help_tags)
vim.keymap.set('n', '<leader>w', require('telescope.builtin').grep_string)
vim.keymap.set('n', '<leader>sf', require('telescope.builtin').live_grep)
vim.keymap.set('n', '<leader>so', function()
        require('telescope.builtin').tags { only_current_buffer = true }
end)
vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles)
vim.api.nvim_set_keymap(
        "n",
        "<space>fb",
        ":Telescope file_browser <CR>",
        { noremap = true }
)
