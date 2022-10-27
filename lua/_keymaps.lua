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
vim.keymap.set('n', '<A-q>', ':bd<CR>')
vim.keymap.set('n', '<tab>', ':bNext<CR>', { silent = true })
vim.keymap.set('n', '<s-tab>', ':bprevious<CR>', { silent= true})
vim.keymap.set('n', '<C-P>', ':Neogen <CR>', { silent = true })
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('n', '<F10>', ':TransparentToggle<CR>')

--For moving lines up and down
vim.keymap.set('v', '<C-J>', ':m \'>+1<CR>gv=gv')
vim.keymap.set('v', '<C-K>', ':m \'>-2<CR>gv=gv')
vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv')
vim.keymap.set('v', '<C-P>', ':Neogen <CR>', { silent = true })

-- Search/replace 
vim.keymap.set('n', '<c-w><c-r>', ':%s/<c-r><c-w>//g<left><left>')
vim.keymap.set('n', 'rn', ':%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>')
vim.keymap.set('n', '<leader>_', ':noh<CR>', { silent = true })

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

-- Toggleterm
vim.api.nvim_set_keymap("n", "<leader>lg", "<cmd>lua _lazygit_toggle()<CR>", {noremap = true, silent = true})


-- Telescope
vim.keymap.set('n', '<leader><space>', function()
        require('telescope.builtin').find_files { previewer = false, hidden = true }
end)
vim.keymap.set('n', '<leader>ff', require('telescope.builtin').current_buffer_fuzzy_find)
vim.keymap.set('n', '<leader>hh', require('telescope.builtin').help_tags)
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
vim.keymap.set('n', '<leader>p', ':Telescope project <CR>')

-- DAP
vim.keymap.set('n', '<F3>', ":lua require'dapui'.toggle()<CR>", {silent=true})
vim.keymap.set('n', '<F4>', ":lua require'dap'.toggle_breakpoint()<CR>")
vim.keymap.set('n', '<F5>', ":lua require'dap'.continue()<CR>")
vim.keymap.set('n', '<F6>', ":lua require'dap'.step_over()<CR>")
vim.keymap.set('n', '<F7>', ":lua require'dap'.step_into()<CR>")
vim.keymap.set('n', '<F8>', ":lua require'dap'.step_out()<CR>")


-- restore the session for the current directory
vim.api.nvim_set_keymap("n", "<leader>qs", [[<cmd>lua require("persistence").load()<cr>]], {})

-- restore the last session
vim.api.nvim_set_keymap("n", "<leader>ql", [[<cmd>lua require("persistence").load({ last = true })<cr>]], {})

-- stop Persistence => session won't be saved on exit
vim.api.nvim_set_keymap("n", "<leader>qd", [[<cmd>lua require("persistence").stop()<cr>]], {})

-- Harpoon
vim.keymap.set('n', '<leader>ha', ":lua require('harpoon.mark').add_file()<CR>")
vim.keymap.set('n', '<leader>ho', ":lua require('harpoon.ui').toggle_quick_menu()<CR>")
vim.keymap.set('n', '<C-1>', ":lua require('harpoon.ui').nav_file(1)<CR>")
vim.keymap.set('n', '<C-2>', ":lua require('harpoon.ui').nav_file(2)<CR>")
vim.keymap.set('n', '<C-3>', ":lua require('harpoon.ui').nav_file(3)<CR>")
vim.keymap.set('n', '<C-4>', ":lua require('harpoon.ui').nav_file(4)<CR>")
vim.keymap.set('n', '<C-5>', ":lua require('harpoon.ui').nav_file(5)<CR>")
vim.keymap.set('n', '<C-6>', ":lua require('harpoon.ui').nav_file(6)<CR>")
vim.keymap.set('n', '<C-7>', ":lua require('harpoon.ui').nav_file(7)<CR>")
vim.keymap.set('n', '<C-8>', ":lua require('harpoon.ui').nav_file(8)<CR>")
vim.keymap.set('n', '<C-9>', ":lua require('harpoon.ui').nav_file(9)<CR>")
vim.keymap.set('n', '<leader>hn', ":lua require('harpoon.ui').nav_next()<CR>")
vim.keymap.set('n', '<leader>hp', ":lua require('harpoon.ui').nav_prev()<CR>")
vim.keymap.set('i', '<c-e>', '<esc>A', {noremap = true})
vim.keymap.set('i', '<c-b>', '<esc>I', {noremap = true})
