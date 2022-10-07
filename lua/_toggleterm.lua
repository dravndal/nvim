require("toggleterm").setup{
      size = 13,
      open_mapping = [[<c-\>]],
      shade_filetypes = {},
      shade_terminals = true,
      shading_factor = '1',
      start_in_insert = true,
      persist_size = true,
      direction = 'float',
      highlights = {
        -- highlights which map to a highlight group name and a table of it's values
        -- NOTE: this is only a subset of values, any group placed here will be set for the terminal window split
        Normal = {
          guibg  = "#1a1b26"
        },
        NormalFloat = {
          guibg = "#1a1b26"
        },
        FloatBorder = {
          guifg = "#18181a",
          guibg = "#1a1b26"
        },
      },
      float_opts = {
        -- The border key is *almost* the same as 'nvim_open_win'
        -- see :h nvim_open_win for details on borders however
        -- the 'curved' border is a custom border type
        -- not natively supported but implemented in this plugin.
        border = 'rounded',
        -- like `size`, width and height can be a number or function which is passed the current terminal
        winblend = 3,
      },
}
--Toggleterm for floating terminals with different cmd's attached
local Terminal  = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new({ count = 2, cmd = "lazygit", hidden = true, direction = "float" })
local spotify = Terminal:new({ count = 3, cmd = "spt", hidden = true, direction = "float"})

function _lazygit_toggle()
  lazygit:toggle()
end

function _spotify_toggle()
    spotify:toggle()
end

vim.api.nvim_set_keymap("n", "<leader>lg", "<cmd>lua _lazygit_toggle()<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>spt", "<cmd>lua _spotify_toggle()<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<F6>", ":3TermExec cmd='spt playback --toggle' open=0<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<F7>", ":3TermExec cmd='spt playback --next' open=0<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<F5>", ":3TermExec cmd='spt playback --previous' open=0<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<F8>", ":3TermExec cmd='spt playback --shuffle' open=0<CR>", {noremap = true, silent = true})

function _G.set_terminal_keymaps()
  local opts = {buffer = 0}
  vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
  vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
  vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
  vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
