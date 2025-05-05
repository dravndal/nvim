return {
	-- lazy.nvim
	{
		"folke/snacks.nvim",
		priority = 1000,
		lazy = false,
		opts = {
			quickfile = { enabled = true },
			picker = {
				enabled = true,
				sources = {
					files = {
						ignored = false,
						hidden = false,
					},
				},
			},
			bufdelete = { enabled = true },
			rename = { enabled = true },
		},
		keys = {
			{
				"<leader>so",
				function()
					Snacks.picker.lsp_symbols()
				end,
				"",
			},
			{
				"gr",
				function()
					Snacks.picker.lsp_references()
				end,
				"",
			},
			{
				"gy",
				function()
					Snacks.picker.lsp_type_definitions()
				end,
				"",
			},
			{
				"gI",
				function()
					Snacks.picker.lsp_implementations()
				end,
				"",
			},
			{
				"<leader>l",
				function()
					Snacks.picker.buffers()
				end,
				desc = "Buffers",
			},
			{
				"<leader>/",
				function()
					Snacks.picker.grep()
				end,
				desc = "Grep",
			},
			{
				"<leader>:",
				function()
					Snacks.picker.command_history()
				end,
				desc = "Command History",
			},
			{
				"<leader><space>",
				function()
					Snacks.picker.files()
				end,
				desc = "Find Files",
			},
			{
				"<leader>cp",
				function()
					Snacks.picker.files({
						dirs = { "/home/danielr/corepublish/corepublish/", "/home/danielr/corepublish/cplib" },
					})
				end,
				desc = "Find Files",
			},
			-- find
			{
				"<leader>sn",
				function()
					Snacks.picker.files({ cwd = vim.fn.stdpath("config") })
				end,
				desc = "Find Config File",
			},
			{
				"<leader>fg",
				function()
					Snacks.picker.git_files()
				end,
				desc = "Find Git Files",
			},
			{
				"<leader>fr",
				function()
					Snacks.picker.recent()
				end,
				desc = "Recent",
			},
			-- git
			{
				"<leader>gc",
				function()
					Snacks.picker.git_log()
				end,
				desc = "Git Log",
			},
			{
				"<leader>gs",
				function()
					Snacks.picker.git_status()
				end,
				desc = "Git Status",
			},
			-- Grep
			{
				"<leader>sb",
				function()
					Snacks.picker.lines()
				end,
				desc = "Buffer Lines",
			},
			{
				"<leader>sf",
				function()
					Snacks.picker.grep()
				end,
				desc = "Buffer Lines",
			},
			{
				"<leader>sc",
				function()
					Snacks.picker.grep({
						dirs = { "/home/danielr/corepublish/corepublish/", "/home/danielr/corepublish/cplib" },
					})
				end,
				desc = "Buffer Lines",
			},
			{
				"<leader>/",
				function()
					Snacks.picker.grep_buffers()
				end,
				desc = "Grep Open Buffers",
			},
			{
				"<leader>sw",
				function()
					Snacks.picker.grep_word()
				end,
				desc = "Visual selection or word",
				mode = { "n", "x" },
			},
			-- search
			{
				"<leader>q",
				function()
					Snacks.picker.diagnostics()
				end,
				desc = "Diagnostics",
			},
			{
				"<leader>hh",
				function()
					Snacks.picker.help()
				end,
				desc = "Help Pages",
			},
			{
				"<leader>mm",
				function()
					Snacks.picker.man()
				end,
				desc = "Man Pages",
			},
			{
				"<leader>sq",
				function()
					Snacks.picker.qflist()
				end,
				desc = "Quickfix List",
			},
			{
				"<leader>sp",
				function()
					Snacks.picker.projects()
				end,
				desc = "Projects",
			},
			{
				"<A-q>",
				function()
					Snacks.bufdelete()
				end,
				desc = "delete buffer",
			},
		},
	},
}
