-- Gitsigns
require('gitsigns').setup {
        signs = {
                add = { text = '+' },
                change = { text = '~' },
                delete = { text = '_' },
                topdelete = { text = '‾' },
                changedelete = { text = '~' },
        },
        current_line_blame = false,
        current_line_blame_opts = {
            virt_text_pos = 'right_align',
            delay = 10
        },
        current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d>'
}
