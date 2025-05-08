return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		enabled = false,
		opts = {
			flavour = "macchiato",
			transparent_background = true,
		},
		priority = 1000,
	},
	{
		"rose-pine/neovim",
		enabled = false,
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
		name = 'vscode',
		enabled = false,
		opts = {
			transparent = true,
		}
	},
	{
		"scottmckendry/cyberdream.nvim",
		name = "cyberdream",
		lazy = false,
		priority = 1000,
		opts = {
			transparent = true,
			cache = true,
		}
	}
}
