return {
	{
		"j-hui/fidget.nvim",
		event = "LspAttach",
		opts = {},
	},
	{
		"saghen/blink.cmp",
		config = function()
			require("blink.cmp").setup({
				sources = {
					default = { "lsp", "easy-dotnet", "snippets", "path", "buffer" },

					providers = {
						["easy-dotnet"] = {
							name = "easy-dotnet",
							enabled = true,
							module = "easy-dotnet.completion.blink",
							score_offset = 10000,
							async = true,
						},
					},
				},
				appearance = {
					nerd_font_variant = "mono",
				},
				keymap = {
					["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
					["<CR>"] = { "select_and_accept", "fallback" },
					["<C-e>"] = { "hide", "show" },
					["<C-p>"] = { "select_prev", "fallback" },
					["<C-n>"] = { "select_next", "fallback" },
					["<C-b>"] = { "scroll_documentation_up", "fallback" },
					["<C-f>"] = { "scroll_documentation_down", "fallback" },
				},
				completion = {
					menu = {
						border = "single",
					},
					accept = {
						auto_brackets = {
							enabled = true,
						},
					},
					documentation = {
						auto_show = true,
						auto_show_delay_ms = 300,
						window = {
							border = "single",
						},
					},
				},
				signature = {
					enabled = true,
					window = {
						border = "single",
					},
				},
			})

			-- Set default capabilities from blink.cmp for all LSP servers
			vim.lsp.config("*", {
				capabilities = require("blink.cmp").get_lsp_capabilities(),
			})

			-- Diagnostic configuration
			vim.diagnostic.config({
				signs = false,
				virtual_text = {
					prefix = "●",
					severity = { min = vim.diagnostic.severity.WARN },
				},
			})

			-- Remove background from diagnostic virtual text
			local function customize_diagnostic_highlights()
				for _, type in ipairs({ "Error", "Warn", "Hint", "Info" }) do
					vim.api.nvim_set_hl(0, "DiagnosticVirtualText" .. type,
						{ link = "Diagnostic" .. type })
				end
			end
			customize_diagnostic_highlights()
			vim.api.nvim_create_autocmd("ColorScheme", { callback = customize_diagnostic_highlights })

			-- LspAttach autocmd for keymaps
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
				callback = function(event)
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

					if client and client:supports_method("textDocument/formatting") then
						vim.keymap.set({ "n", "x" }, "<leader>gg", function()
							vim.lsp.buf.format({ async = true })
						end, { buffer = event.buf, desc = "LSP: [L]ayout [F]ormat" })
					end
				end,
			})

			-- Enable all LSP servers
			vim.lsp.enable({
				"lua_ls",
				"gopls",
				"gleam",
				"ts_ls",
				"cssls",
				"clangd",
				"tailwindcss",
				"html",
				"emmet_ls",
				"intelephense",
				"rust_analyzer",
			})
		end,
		version = "1.*",
		opts_extend = { "sources.default" },
	},
}
