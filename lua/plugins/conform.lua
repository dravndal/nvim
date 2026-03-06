return {
	"stevearc/conform.nvim",
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			javascript = { "eslint_d", "prettierd" },
			typescript = { "eslint_d", "prettierd" },
			javascriptreact = { "eslint_d", "prettierd" },
			typescriptreact = { "eslint_d", "prettierd" },
			css = { lsp_format = "fallback" },
			scss = { lsp_format = "fallback" },
			json = { "prettierd" },
			yaml = { "prettierd" },
			markdown = { "prettierd" },
			html = { lsp_format = "fallback" },
			php = { lsp_format = "fallback" },
			cs = { lsp_format = "fallback" },
		},
		format_on_save = {
			timeout_ms = 3000,
			lsp_fallback = true,
		},
	},
}
