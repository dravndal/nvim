---@type vim.lsp.Config
return {
  cmd = { 'emmet-ls', '--stdio' },
  filetypes = {
    'css',
    'html',
    'javascript',
    'javascriptreact',
    'sass',
    'scss',
    'svelte',
    'typescriptreact',
    'vue',
    'twig',
  },
  root_markers = { '.git' },
}