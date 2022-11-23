-- Telescope
require('telescope').setup {
        extensions = {
              file_browser = {
                    path = "%:p:h",
              }
        },
        defaults = {
                mappings = {
                        i = {
                                ['<C-u>'] = false,
                                ['<C-d>'] = false,
                                ['<C-h>'] = require'telescope'.extensions.send_to_harpoon.actions.send_selected_to_harpoon,
                        },
                        n = {
                                ['<C-h>'] = require'telescope'.extensions.send_to_harpoon.actions.send_selected_to_harpoon,
                        }
                },
        },
        pickers = {
                find_files = {
                        hidden = true,
                        theme = "ivy",
                },
        }
}

-- Enable telescope fzf native
require('telescope').load_extension 'fzf'

-- Enable telescope file browser
require('telescope').load_extension 'file_browser'

-- Enable telescope project
require('telescope').load_extension 'project'

-- Enable telescope harpon
require('telescope').load_extension 'send_to_harpoon'
