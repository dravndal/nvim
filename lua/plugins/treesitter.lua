---@diagnostic disable: missing-fields
---@module 'lazy'
---@type LazySpec
return {
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    branch = 'main',
    config = function()
      local treesitter = require('nvim-treesitter')
      treesitter.setup {}
      local should_install = {
        'fsharp',
        'c_sharp',
        'vim',
        'c',
        'printf',
        'powershell',
        'nix',
        'xml',
        'css',
        'bash',
        'cpp',
        'diff',
        'lua',
        'luap',
        'luadoc',
        'vim',
        'vimdoc',
        'typescript',
        'javascript',
        'jsdoc',
        'html',
        'http',
        'json',
        'sql',
        'python',
        'csv',
        'vue',
        'gitignore',
        'gitcommit',
        'gitattributes',
        'git_config',
        'go',
        'query',
        'toml',
        'yaml',
        'regex',
        'markdown',
        'markdown_inline',
      }

      treesitter.install(should_install)

      vim.api.nvim_create_autocmd('FileType', {
        callback = function(args)
          if
              vim.list_contains(
                treesitter.get_installed(),
                vim.treesitter.language.get_lang(args.match)
              )
          then
            vim.treesitter.start(args.buf)
          end
        end,
      })
    end,
  },
}
