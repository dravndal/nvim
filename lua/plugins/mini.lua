return {
	{
		"nvim-mini/mini.diff",
		version = false,
		opts = {
			view = {
				style = "sign",
				signs = { add = "▎", change = "▎", delete = "" },
			},
		},
	},
	{
		"nvim-mini/mini.snippets",
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
		"nvim-mini/mini.statusline",
		version = false,
		opts = {},
	},
	{
		"nvim-mini/mini.pairs",
		version = false,
		opts = {},
	},
	{
		"nvim-mini/mini.surround",
		version = false,
		opts = {},
	},
	{
		"nvim-mini/mini.ai",
		version = false,
		opts = {},
	},
	{
		"nvim-mini/mini.hipatterns",
		version = false,
		opts = {
			highlighters = {
				fixme = { pattern = "%f[%w]()FIXME()%f[%W]", group = "MiniHipatternsFixme" },
				hack = { pattern = "%f[%w]()HACK()%f[%W]", group = "MiniHipatternsHack" },
				todo = { pattern = "%f[%w]()TODO()%f[%W]", group = "MiniHipatternsTodo" },
				note = { pattern = "%f[%w]()NOTE()%f[%W]", group = "MiniHipatternsNote" },
			},
		},
	},
}
