return {
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			{
				"williamboman/mason.nvim",
				config = true,
				opts = {
					registries = {
						"github:mason-org/mason-registry",
						"github:Crashdummyy/mason-registry",
					},
				},
			},
			"williamboman/mason-lspconfig.nvim",
			{
				"onsails/lspkind.nvim",
			},
		},
		config = function()
			-- Set up diagnostic signs with icons using vim.diagnostic.config (Neovim 0.10+ compatible)
			vim.diagnostic.config({
				signs = false,
				virtual_text = {
					prefix = "●",
				},
			})

			-- Remove background from diagnostic virtual text
			local function customize_diagnostic_highlights()
				for _, type in ipairs({ "Error", "Warn", "Hint", "Info" }) do
					vim.api.nvim_set_hl(0, "DiagnosticVirtualText" .. type, { link = "Diagnostic" .. type })
				end
			end
			customize_diagnostic_highlights()
			vim.api.nvim_create_autocmd("ColorScheme", { callback = customize_diagnostic_highlights })

			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
				callback = function(event)
					local client = vim.lsp.get_client_by_id(event.data.client_id)
					if client and client:supports_method("textDocument/documentColor") then
						pcall(vim.lsp.document_color.enable, true, event.buf)
					end

					local map = function(keys, func, desc, mode)
						mode = mode or "n"
						vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
					end
					-- map("gd", "<C-]>", "[G]oto [D]efinition")
					map("gd", vim.lsp.buf.definition, "[G]oto [D]efinition")
					map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
					map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction", { "n", "x" })
					map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
					map("K", vim.lsp.buf.hover, "Hover Documentation")

					if client and client:supports_method("textDocument/formatting") then
						vim.keymap.set({ "n", "x" }, "<leader>gg", function()
							vim.lsp.buf.format({ async = true })
						end, { buffer = event.buf, desc = "LSP: [L]ayout [F]ormat" })
					end
				end,
			})

			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities = require("blink.cmp").get_lsp_capabilities()

			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup({
				capabilities = capabilities,
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" }, -- Fixes "Undefined global 'vim'" warning
						},
					},
				},
			})

			local servers = {
				cssls = {},
				clangd = {},
				tailwindcss = {},
				html = {
					filetypes = { "html", "twig", "blade" },
				},
				emmet_ls = {
					filetypes = {
						"css",
						"html",
						"javascript",
						"javascriptreact",
						"sass",
						"scss",
						"svelte",
						"typescriptreact",
						"vue",
						"twig",
					},
				},
				intelephense = {
					settings = {
						intelephense = {
							files = {
								maxSize = 10000000,
							},
						},
					},
					init_options = {
						licenceKey = "006F3Y69WS65HCI",
					},
				},
				ts_ls = {
					root_dir = function(...)
						return require("lspconfig.util").root_pattern(".git")(...) or vim.fn.getcwd()
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
				handlers = {
					function(server_name)
						local server_opts = servers[server_name] or {}
						server_opts.capabilities =
							vim.tbl_deep_extend("force", {}, capabilities, server_opts.capabilities or {})
						require("lspconfig")[server_name].setup(server_opts)
					end,
				},
			})
		end,
	},
	{
		"seblyng/roslyn.nvim",
		opts = {},
	},
}
