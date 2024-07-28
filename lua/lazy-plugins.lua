require("lazy").setup({

	"tpope/vim-sleuth", -- Detect tabstop and shiftwidth automatically
	require("kickstart/plugins/telescope"),
	require("kickstart/plugins/autopairs"),
	require("kickstart/plugins/lspconfig"),
	require("kickstart/plugins/cmp"),
	require("kickstart/plugins/tokyonight"),
	require("kickstart/plugins/mini"),
	require("kickstart/plugins/treesitter"),
	require("kickstart/plugins/blame"),

	{ import = "custom.plugins" },
}, {
	ui = {
		-- If you are using a Nerd Font: set icons to an empty table which will use the
		-- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
		icons = vim.g.have_nerd_font and {} or {
			cmd = "⌘",
			config = "🛠",
			event = "📅",
			ft = "📂",
			init = "⚙",
			keys = "🗝",
			plugin = "🔌",
			runtime = "💻",
			require = "🌙",
			source = "📄",
			start = "🚀",
			task = "📌",
			lazy = "💤 ",
		},
	},
})
