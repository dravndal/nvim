return {
	"stevearc/conform.nvim",
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			javascript = { "prettierd" },
			typescript = { "prettierd" },
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
