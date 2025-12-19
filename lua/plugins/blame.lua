return {
	{
		"FabijanZulj/blame.nvim",
		lazy = false,
		config = function()
			require("blame").setup({

				virtual_style = "right_align",
				views = {
					window = window_view,
					virtual = virtual_view,
					default = virtual_view,
				},
				focus_blame = true,
			})
		end,
	},
}
