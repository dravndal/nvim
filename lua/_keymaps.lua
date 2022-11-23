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
vim.keymap.set('n', '<tab>', ':bNext<CR>', { silent = true })
vim.keymap.set('n', '<s-tab>', ':bprevious<CR>', { silent= true})
vim.keymap.set('n', '<C-P>', ':Neogen <CR>', { silent = true })
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')

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
vim.keymap.set('n', ';D', vim.diagnostic.goto_prev)
vim.keymap.set('n', ',d', vim.diagnostic.goto_next)

vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist)

-- Git Signs
vim.keymap.set('n', '<leader>gb', ":Gitsigns toggle_current_line_blame <CR>", {silent=true})


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

-- Svart
vim.keymap.set({ "n", "x", "o" }, "s", "<Cmd>Svart<CR>")        -- begin exact search
vim.keymap.set({ "n", "x", "o" }, "S", "<Cmd>SvartRegex<CR>")   -- begin regex search
vim.keymap.set({ "n", "x", "o" }, "gs", "<Cmd>SvartRepeat<CR>") -- repeat with last accepted query

-- Multiple cursors
vim.cmd([[
    let g:mc = "y/\\V\<C-r>=escape(@\", '/')\<CR>\<CR>"

    nnoremap cn *``cgn
    nnoremap cN *``cgN

    vnoremap <expr> cn g:mc . "``cgn"
    vnoremap <expr> cN g:mc . "``cgN"

    function! SetupCR()
      nnoremap <Enter> :nnoremap <lt>Enter> n@z<CR>q:<C-u>let @z=strpart(@z,0,strlen(@z)-1)<CR>n@z
    endfunction

    nnoremap cq :call SetupCR()<CR>*``qz
    nnoremap cQ :call SetupCR()<CR>#``qz

    vnoremap <expr> cq ":\<C-u>call SetupCR()\<CR>" . "gv" . g:mc . "``qz"
    vnoremap <expr> cQ ":\<C-u>call SetupCR()\<CR>" . "gv" . substitute(g:mc, '/', '?', 'g') . "``qz"
]])
