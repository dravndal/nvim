return {
	{
		"folke/tokyonight.nvim",
		priority = 1000,
		init = function()
			vim.cmd.colorscheme("tokyonight-night")
			vim.cmd.hi("Comment gui=none")
		end,
		opts = {
			transparent = true,

			on_colors = function(colors)
				colors.bg_float = "none"
			end
		}
	},
}
