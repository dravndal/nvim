return {
	{
		"echasnovski/mini.diff",
		version = false,
		opts = {},
	},
	{
		"echasnovski/mini.snippets",
		version = false,
		config = function()
			local gen_loader = require("mini.snippets").gen_loader
			require("mini.snippets").setup({
				snippets = {
					gen_loader.from_lang(),
				},
			})
		end,
	},
	{
		"echasnovski/mini.statusline",
		version = false,
		opts = {},
	},
	{
		"echasnovski/mini.pairs",
		version = false,
		opts = {},
	},
	{
		"echasnovski/mini.surround",
		version = false,
		opts = {},
	},
	{
		"echasnovski/mini.ai",
		version = false,
		opts = {},
	},
}
