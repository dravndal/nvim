-- Null-ls for injecting phpcs into neovim diagnostics
require("null-ls").setup({
    sources = {
        require("null-ls").builtins.diagnostics.phpcs.with({
            filetypes = { "scss", "javascript", "typescript", "php"},
            extra_args = {
              "--standard=vendor/coretrek/php-codingstandards/ruleset.xml"
              -- "--standard=ruleset.xml"
            }
        }),
    },
})
