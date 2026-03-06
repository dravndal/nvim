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
	{
		"samharju/synthweave.nvim",
		lazy = false,
		priority = 1000,
	},
	{
		"2giosangmitom/nightfall.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
	},
	{ "EdenEast/nightfox.nvim" } -- lazy
}
