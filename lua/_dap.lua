--Nvim DAP for injecting debuigging protocols in neovim
local dap = require('dap')

dap.adapters.php = {
        type = 'executable',
        command = 'node',
        args = {'/home/danielr/.local/share/nvim/mason/packages/php-debug-adapter/extension/out/phpDebug.js'}
}
dap.configurations.php = {
  {
    type = 'php',
    request = 'launch',
    name = 'Listen for Xdebug',
    port = 9000,
    pathMappings = {
      serverSourceRoot = '/home/danielr/public_html/devel/intranet-coretrek-no',
      localSourceRoot = '${workspaceRoot}'
    }
  },
}

require("nvim-dap-virtual-text").setup()
require("dapui").setup()
