return {
	{
		"theprimeagen/harpoon",
		branch = "harpoon2",
		event = "VeryLazy",
		config = function()
			local harpoon = require("harpoon")

			harpoon:setup()
			vim.keymap.set("n", "<leader>ha", function()
				harpoon:list():add()
			end)
			vim.keymap.set("n", "<leader>ho", function()
				harpoon.ui:toggle_quick_menu(harpoon:list())
			end)

			vim.keymap.set("n", "<A-1>", function()
				harpoon:list():select(1)
			end)
			vim.keymap.set("n", "<A-2>", function()
				harpoon:list():select(2)
			end)
			vim.keymap.set("n", "<A-3>", function()
				harpoon:list():select(3)
			end)
			vim.keymap.set("n", "<A-4>", function()
				harpoon:list():select(4)
			end)
			vim.keymap.set("n", "<A-5>", function()
				harpoon:list():select(5)
			end)
			vim.keymap.set("n", "<A-6>", function()
				harpoon:list():select(6)
			end)
			vim.keymap.set("n", "<A-7>", function()
				harpoon:list():select(7)
			end)
		end,
	},
}
