-- Highlight on yank
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
        callback = function()
                vim.highlight.on_yank()
        end,
        group = highlight_group,
        pattern = '*',
})

vim.api.nvim_create_autocmd('BufReadPre', { command = [[:syntax on]] })

local signs = {
    Error = "🦀",
    Warning = "🦞",
    Hint = "🦐",
    Information = "🦑"
}

for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, {text = icon, texthl = hl, numhl = hl})
end

vim.diagnostic.config({
  virtual_text = {
    prefix = "🐳",
  },
})
