return {
	{
		"saghen/blink.cmp",
		event = "InsertEnter",
		enabled = true,
		version = "v1.*",
		dependencies = { "rafamadriz/friendly-snippets" },

		opts = {
			sources = {
				default = { "lsp", "snippets", "path", "buffer" },
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
		},
		opts_extend = { "sources.default" },
	},
}
