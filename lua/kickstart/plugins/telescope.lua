return {
	{
		"nvim-telescope/telescope.nvim",
		event = "VeryLazy",
		branch = "master",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "make",
				cond = function()
					return vim.fn.executable("make") == 1
				end,
			},
			{ "nvim-telescope/telescope-ui-select.nvim" },
			{ "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
		},
		config = function()
			require("telescope").setup({
				defaults = {
          file_ignore_patterns = { "node_modules", "vendor", ".git", "build", "html/" },
          path_display = {
            "filename_first",
          },
				},
				pickers = {
          find_files = {
            path_display = {
              "filename_first",
            },
          },
        },
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown(),
					},
				},
			})

			-- Enable Telescope extensions if they are installed
			pcall(require("telescope").load_extension, "fzf")
			pcall(require("telescope").load_extension, "ui-select")

			-- See `:help telescope.builtin`
			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<leader>hh", builtin.help_tags, { desc = "Search Help" })
			vim.keymap.set("n", "<leader>sk", builtin.keymaps, { desc = "[S]earch [K]eymaps" })
			vim.keymap.set("n", "<leader><leader>", builtin.find_files, { desc = "Search Files" })
			vim.keymap.set("n", "<leader>ss", builtin.builtin, { desc = "[S]earch [S]elect Telescope" })
			vim.keymap.set("n", "<leader>w", builtin.grep_string, { desc = "Search current Word" })
			vim.keymap.set("n", "<leader>sf", builtin.live_grep, { desc = "Search by Grep" })
			vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "[S]earch [D]iagnostics" })
			vim.keymap.set("n", "<leader>sr", builtin.resume, { desc = "[S]earch [R]esume" })
			vim.keymap.set("n", "<leader>?", builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
			vim.keymap.set("n", "<leader>l", builtin.buffers, { desc = "[ ] Find existing buffers" })

			vim.keymap.set("n", "<leader>cp", function()
				require("telescope.builtin").find_files({
					winblend = 10,
					search_dirs = { ".", "/home/danielr/Work/Projects/corepublish/" },
					additional_args = { "--no-ignore-vcs", "-F", "-Tmarkdown" },
					hidden = true,
				})
			end, {})

			vim.keymap.set("n", "<leader>sc", function()
				require("telescope.builtin").live_grep({
					winblend = 10,
					search_dirs = { ".", "/home/danielr/Work/Projects/corepublish/" },
					additional_args = { "--no-ignore-vcs", "-F", "-Tmarkdown" },
				})
			end, {})

			vim.keymap.set("n", "<leader>/", function()
				builtin.live_grep({
					grep_open_files = true,
					prompt_title = "Live Grep in Open Files",
				})
			end, { desc = "[S]earch [/] in Open Files" })

			-- Shortcut for searching your Neovim configuration files
			vim.keymap.set("n", "<leader>sn", function()
				builtin.find_files({ cwd = vim.fn.stdpath("config") })
			end, { desc = "[S]earch [N]eovim files" })
		end,
	},
}
