return {
	{
		"zootedb0t/citruszest.nvim",
		lazy = false,
		priority = 1000,
		init = function()
			vim.cmd.colorscheme("citruszest")
		end,
		opts = {
			transparent = true,
		}
	},
}
