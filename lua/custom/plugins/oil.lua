return {
	{
		"stevearc/oil.nvim",
		opts = {
			view_options = {
				show_hidden = true,
			},
			keymaps = {
				["q"] = "actions.close",
			},
			float = {
				max_width = 120,
				max_height = 20,
			},
		},
		-- Optional dependencies
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
}
