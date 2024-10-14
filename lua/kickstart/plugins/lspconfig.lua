return {
	{ -- LSP Configuration & Plugins
		"neovim/nvim-lspconfig",
		dependencies = {
			-- Automatically install LSPs and related tools to stdpath for Neovim
			{ "williamboman/mason.nvim", config = true },
			"williamboman/mason-lspconfig.nvim",
			{
				"onsails/lspkind.nvim",
				event = "LspAttach",
			},
		},
		config = function()
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
				callback = function(event)
					local map = function(keys, func, desc)
						vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
					end

					map("gd", "<cmd>Lspsaga goto_definition<CR>", "[G]oto [D]efinition")
					map("gh", "<cmd>Lspsaga finder <CR>", "Find all uses")
					map("<space>gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
					map("gI", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")
					map("<leader>gd", "<cmd>Lspsaga peek_definition<CR>", "Peak definition")
					map("<leader>D", require("telescope.builtin").lsp_type_definitions, "Type [D]efinition")
					map("<leader>so", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")
					map("<leader>rn", "<cmd>Lspsaga rename<CR>", "[R]e[n]ame")
					map("<leader>ca", "<cmd>Lspsaga code_action<CR>", "[C]ode [A]ction")
					map("K", "<cmd>Lspsaga hover_doc <CR>", "Hover Documentation")
					map("<C-k>", vim.lsp.buf.signature_help, "Signature Documentation")
				end,
			})

			-- LSP servers and clients are able to communicate to each other what features they support.
			--  By default, Neovim doesn't support everything that is in the LSP specification.
			--  When you add nvim-cmp, luasnip, etc. Neovim now has *more* capabilities.
			--  So, we create new capabilities with nvim cmp, and then broadcast that to the servers.
			local capabilities = vim.lsp.protocol.make_client_capabilities()

			-- Enable the following language servers
			--  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
			--
			--  Add any additional override configuration in the following tables. Available keys are:
			--  - cmd (table): Override the default command used to start the server
			--  - filetypes (table): Override the default list of associated filetypes for the server
			--  - capabilities (table): Override fields in capabilities. Can be used to disable certain LSP features.
			--  - settings (table): Override the default settings passed when initializing the server.
			--        For example, to see the options for `lua_ls`, you could go to: https://luals.github.io/wiki/settings/
			local servers = {
				lua_ls = {
					-- cmd = {...},
					-- filetypes = { ...},
					-- capabilities = {},
					settings = {
						Lua = {
							completion = {
								callSnippet = "Replace",
							},
							-- You can toggle below to ignore Lua_LS's noisy `missing-fields` warnings
							diagnostics = { disable = { "missing-fields" } },
						},
					},
				},
			}

			-- Ensure the servers and tools above are installed
			--  To check the current status of installed tools and/or manually install
			--  other tools, you can run
			--    :Mason
			--
			--  You can press `g?` for help in this menu.
			require("mason").setup()

			-- You can add other tools here that you want Mason to install
			-- for you, so that they are available from within Neovim.
			local ensure_installed = vim.tbl_keys(servers or {})
			vim.list_extend(ensure_installed, {
				"stylua", -- Used to format Lua code
			})
			require("mason-lspconfig").setup({
				handlers = {
					function(server_name)
						local server = servers[server_name] or {}
						-- This handles overriding only values explicitly passed
						-- by the server configuration above. Useful when disabling
						-- certain features of an LSP (for example, turning off formatting for tsserver)
						server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
						require("lspconfig")[server_name].setup(server)
						require("lspconfig").ts_ls.setup({
							single_file_support = true,
						})
						require("lspconfig").intelephense.setup({
							settings = {
								intelephense = {
									environment = {
										includePaths = {
											"vendor/",
											"/home/danielr/corepublish/cplib/",
											"/home/danielr/corepublish/corepublish/",
										},
									},
									files = {
										maxSize = 10000000,
									},
								},
							},
							init_options = {
								licenceKey = "006F3Y69WS65HCI",
							},
						})
						require("lspconfig").twiggy_language_server.setup({
							settings = {
								twiggy = {
									framework = "symfony",
									phpExecutable = "/usr/bin/php",
									symfonyConsolePath = "bin/console",
								},
							},
						})
					end,
				},
			})
		end,
	},
	{
		"nvimdev/lspsaga.nvim",
		event = "LspAttach",
		opts = {
			symbol_in_winbar = {
				delay = 100,
				separator = ' › '
			}
		},
		dependencies = {
			{ "nvim-tree/nvim-web-devicons" },
		},
	},
}
