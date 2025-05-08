return {
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			{ "williamboman/mason.nvim", config = true },
			"williamboman/mason-lspconfig.nvim",
			{
				"onsails/lspkind.nvim",
			},
		},
		config = function()
			vim.diagnostic.config {
				underline = true,
				virtual_text = {
					prefix = "●",
					severity = nil,
					source = "if_many",
					format = nil,

				},
				signs = true,
				severity_sort = true,
				update_in_insert = false,
			}

			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
				callback = function(event)
					local client = vim.lsp.get_client_by_id(event.data.client_id)
					if client and client.supports_method("textDocument/documentColor") then
						pcall(vim.lsp.document_color.enable, true, event.buf)
					end

					local map = function(keys, func, desc, mode)
						mode = mode or "n"
						vim.keymap.set(mode, keys, func,
							{ buffer = event.buf, desc = "LSP: " .. desc })
					end
					map("gd", vim.lsp.buf.definition, "[G]oto [D]efinition")
					map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
					map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction", { "n", "x" })
					map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
					map("K", vim.lsp.buf.hover, "Hover Documentation")

					if client and client.supports_method("textDocument/formatting") then
						vim.keymap.set({ "n", "x" }, "<leader>g",
							function() vim.lsp.buf.format({ async = true }) end,
							{ buffer = event.buf, desc = "LSP: [L]ayout [F]ormat" })
					end
				end,
			})

			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities = require('blink.cmp').get_lsp_capabilities()


			local servers = {
				lua_ls = {
					settings = {
						Lua = {
							completion = {
								callSnippet = "Replace",
							},
							diagnostics = {
								globals = { "vim" }, -- Important for Neovim Lua development
							},
							workspace = {
								library = vim.api.nvim_get_runtime_file("", true),
								checkThirdParty = false, -- if you use a lot of plugins
							},
						},
					},
				},
				cssls = {},
				tailwindcss = {},
				html = {
					filetypes = { "html", "twig", "blade" },
				},
				emmet_ls = {
					filetypes = { "css", "html", "javascript", "javascriptreact", "sass", "scss", "svelte", "typescriptreact", "vue", "twig" },
				},
				phpactor = {},
				ts_ls = {
					root_dir = function(...)
						return require("lspconfig.util").root_pattern(".git")(...) or
						    vim.fn.getcwd()
					end,
					single_file_support = true,
					settings = {
						typescript = {
							inlayHints = {
								includeInlayParameterNameHints = "literal",
								includeInlayParameterNameHintsWhenArgumentMatchesName = false,
								includeInlayFunctionParameterTypeHints = true,
								includeInlayVariableTypeHints = false,
								includeInlayPropertyDeclarationTypeHints = true,
								includeInlayFunctionLikeReturnTypeHints = true,
								includeInlayEnumMemberValueHints = true,
							},
						},
						javascript = {
							inlayHints = {
								includeInlayParameterNameHints = "all",
								includeInlayParameterNameHintsWhenArgumentMatchesName = false,
								includeInlayFunctionParameterTypeHints = true,
								includeInlayVariableTypeHints = true,
								includeInlayPropertyDeclarationTypeHints = true,
								includeInlayFunctionLikeReturnTypeHints = true,
								includeInlayEnumMemberValueHints = true,
							},
						},
					},
				},
			}

			require("mason-lspconfig").setup({
				ensure_installed = vim.tbl_keys(servers), -- Automatically install LSPs defined in servers
				handlers = {
					function(server_name)
						local server_opts = servers[server_name] or {}
						server_opts.capabilities = vim.tbl_deep_extend("force", {}, capabilities,
							server_opts.capabilities or {})
						require("lspconfig")[server_name].setup(server_opts)
					end,
				},
			})
		end,
	},
}
