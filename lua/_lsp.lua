-- LSP settings
local lspconfig = require 'lspconfig'
local on_attach = function(_, bufnr)
        local opts = { buffer = bufnr }
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
        vim.keymap.set('n', 'gd', ':Telescope lsp_definitions<CR>')
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
        vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
        vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, opts)
        vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
        vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
        vim.keymap.set('n', '<leader>so', require('telescope.builtin').lsp_document_symbols, opts)
        vim.api.nvim_create_user_command("Format", vim.lsp.buf.formatting, {})
end


-- nvim-cmp supports additional completion capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

-- Enable the following language servers
local servers = { 'clangd', 'rust_analyzer', 'html', 'tsserver', 'cssls', 'pyright' }

require('mason-lspconfig').setup {
  ensure_installed = servers,
}

for _, lsp in ipairs(servers) do
        lspconfig[lsp].setup {
                on_attach = on_attach,
                capabilities = capabilities,
        }
end


-- Example custom server
-- Make runtime files discoverable to the server
local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, 'lua/?.lua')
table.insert(runtime_path, 'lua/?/init.lua')

lspconfig.intelephense.setup {
        on_attach = on_attach,
        capabilities = capabilities,
        root_dir = function() return vim.loop.cwd() end,
        init_options = {
            licenceKey = "006F3Y69WS65HCI",
        }
}

lspconfig.sumneko_lua.setup {
        on_attach = on_attach,
        capabilities = capabilities,
        settings = {
                Lua = {
                        runtime = {
                                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                                version = 'LuaJIT',
                                -- Setup your lua path
                                path = runtime_path,
                        },
                        diagnostics = {
                                -- Get the language server to recognize the `vim` global
                                globals = { 'vim' },
                        },
                        workspace = {
                                -- Make the server aware of Neovim runtime files
                                library = vim.api.nvim_get_runtime_file('', true),
                                checkThirdParty = false,
                        },
                        -- Do not send telemetry data containing a randomized but unique identifier
                        telemetry = {
                                enable = false,
                        },
                },
        },
}
