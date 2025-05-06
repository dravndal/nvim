return {
	{
		"saghen/blink.cmp",
		lazy = false, -- lazy loading handled internally
		enabled = true,
		version = "v0.*",
		dependencies = { "rafamadriz/friendly-snippets" },

		opts = {
			sources = {
				default = { "lsp", "snippets", "path", "buffer" },
			},
			keymap = {
				["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
				["<CR>"] = { "select_and_accept", "fallback" },
				["<C-e>"] = { "hide" },
				["<C-p>"] = { "select_prev", "fallback" },
				["<C-n>"] = { "select_next", "fallback" },
				["<C-b>"] = { "scroll_documentation_up", "fallback" },
				["<C-f>"] = { "scroll_documentation_down", "fallback" },
			},

			completion = {
				menu = {
					border = "rounded",
				},

				accept = {
					auto_brackets = {
						enabled = true,
					},
				},

				documentation = {
					auto_show = true,
					auto_show_delay_ms = 100,

					window = {
						border = "rounded",
					},
				},
			},

			signature = {
				enabled = true,

				window = {
					border = "rounded",
				},
			},
		},
		opts_extend = { "sources.default" },
	},
}
