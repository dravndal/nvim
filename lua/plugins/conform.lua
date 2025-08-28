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
			html = { "prettierd" },
			php = { lsp_format = "fallback" },
		},
	},
}
