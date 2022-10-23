-- Null-ls for injecting phpcs into neovim diagnostics
require("null-ls").setup({
    sources = {
        require("null-ls").builtins.diagnostics.phpcs.with({
            filetypes = { "scss", "javascript", "typescript", "php"},
            extra_args = {
              -- "--standard=vendor/coretrek/php-codingstandards/ruleset.xml"
              "--standard=ruleset.xml"
            }
        }),
        require("null-ls").register(require("null-ls").builtins.diagnostics.psalm.with({
            condition = function(utils)
              return utils.root_has_file("psalm.xml")
            end,
        })),
        require("null-ls").register(require("null-ls").builtins.diagnostics.phpstan.with({
            condition = function(utils)
              return utils.root_has_file("phpstan.neon")
            end,
        })),
    },
})
