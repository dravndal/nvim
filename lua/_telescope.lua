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
                        },
                },
        },
        pickers = {
                find_files = {
                        hidden = true,
                }
        }
}

-- Enable telescope fzf native
require('telescope').load_extension 'fzf'

-- Enable telescope file browser
require('telescope').load_extension 'file_browser'

-- Enable telescope project
require('telescope').load_extension 'project'
