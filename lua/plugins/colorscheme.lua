return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		enabled = true,
		lazy = false,
		opts = {
			flavour = "macchiato",
			transparent_background = true,
		},
		priority = 1000,
	},
	{
		"rose-pine/neovim",
		enabled = true,
		lazy = false,
		name = "rose-pine",
		opts = {
			variant = "moon",
			styles = {
				transparency = true,
			},
		},
	},
	{
		"Mofiqul/vscode.nvim",
		name = "vscode",
		lazy = false,
		enabled = true,
		opts = {
			transparent = true,
		},
	},
	{
		"scottmckendry/cyberdream.nvim",
		name = "cyberdream",
		lazy = false,
		priority = 1000,
		opts = {
			transparent = true,
			cache = true,
		},
	},
	-- Using Lazy
	{
		"navarasu/onedark.nvim",
		priority = 1000, -- make sure to load this before all the other start plugins
		lazy = false,
		config = function()
			require("onedark").setup({
				style = "deep",
				transparent = true,
			})
			require("onedark").load()
		end,
	},
}
