---@type vim.lsp.Config
return {
  cmd = { 'intelephense', '--stdio' },
  filetypes = { 'php' },
  root_markers = { '.git', 'composer.json' },
  settings = {
    intelephense = {
      files = {
        maxSize = 10000000,
      },
    },
  },
  init_options = {
    licenceKey = '006F3Y69WS65HCI',
  },
}