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
		"scottmckendry/cyberdream.nvim",
		name = "cyberdream",
		lazy = false,
		priority = 1000,
		opts = {
			transparent = true,
			cache = true,
		},
	},
}
