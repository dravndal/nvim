return {
	{
		"GustavEikaas/easy-dotnet.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"mfussenegger/nvim-dap",
		},
		ft = { "cs", "fsharp" },
		config = function()
			local dotnet = require("easy-dotnet")

			dotnet.setup({
				lsp = {
					enabled = true,
					roslynator_enabled = true,
					set_fold_expr = false,
					easy_dotnet_analyzer_enabled = true,
					analyzer_assemblies = {},
					config = {},
				},
				debugger = {
					auto_register_dap = true,
				},
				test_runner = {
					viewmode = "float",
					enable_buffer_test_execution = true,
					noBuild = true,
					mappings = {
						run_test_from_buffer = { lhs = "<leader>r", desc = "run test from buffer" },
						run_all_tests_from_buffer = { lhs = "<leader>t", desc = "run all tests from buffer" },
						peek_stack_trace_from_buffer = { lhs = "<leader>p", desc = "peek stack trace from buffer" },
						filter_failed_tests = { lhs = "<leader>fe", desc = "filter failed tests" },
						debug_test = { lhs = "<leader>d", desc = "debug test" },
						go_to_file = { lhs = "g", desc = "go to file" },
						run_all = { lhs = "<leader>R", desc = "run all tests" },
						run = { lhs = "<leader>r", desc = "run test" },
						peek_stacktrace = { lhs = "<leader>p", desc = "peek stacktrace of failed test" },
						expand = { lhs = "o", desc = "expand" },
						expand_node = { lhs = "E", desc = "expand node" },
						expand_all = { lhs = "-", desc = "expand all" },
						collapse_all = { lhs = "W", desc = "collapse all" },
						close = { lhs = "q", desc = "close testrunner" },
						refresh_testrunner = { lhs = "<C-r>", desc = "refresh testrunner" },
					},
				},
				csproj_mappings = true,
				fsproj_mappings = true,
				auto_bootstrap_namespace = {
					type = "file_scoped",
					enabled = true,
				},
				picker = "snacks",
				background_scanning = true,
				-- server = { log_level = "Verbose", },
			})

			-- Keymaps for common .NET operations
			vim.keymap.set("n", "<leader>nr", dotnet.run_default, { desc = "Dotnet: Run (default)" })
			vim.keymap.set("n", "<leader>nR", dotnet.run, { desc = "Dotnet: Run (pick)" })
			vim.keymap.set("n", "<leader>nt", dotnet.testrunner, { desc = "Dotnet: Test Runner" })
			vim.keymap.set("n", "<leader>nb", dotnet.build_default, { desc = "Dotnet: Build (default)" })
			vim.keymap.set("n", "<leader>nB", dotnet.build_quickfix, { desc = "Dotnet: Build (quickfix)" })
			vim.keymap.set("n", "<leader>nc", dotnet.clean, { desc = "Dotnet: Clean" })
			vim.keymap.set("n", "<leader>np", dotnet.project_view, { desc = "Dotnet: Project View" })
			vim.keymap.set("n", "<leader>ns", dotnet.secrets, { desc = "Dotnet: User Secrets" })
			vim.keymap.set("n", "<leader>no", dotnet.outdated, { desc = "Dotnet: Outdated Packages" })
			vim.keymap.set("n", "<leader>nw", dotnet.watch_default, { desc = "Dotnet: Watch (default)" })
			vim.keymap.set("n", "<leader>nd", dotnet.debug_default, { desc = "Dotnet: Debug (default)" })
			vim.keymap.set("n", "<leader>nD", dotnet.debug, { desc = "Dotnet: Debug (pick)" })
		end,
	},
	{
		"mfussenegger/nvim-dap",
		config = function()
			local dap = require "dap"

			-- Keymaps for controlling the debugger
			vim.keymap.set("n", "q", function()
				dap.terminate()
				dap.clear_breakpoints()
			end, { desc = "Terminate and clear breakpoints" })

			vim.keymap.set("n", "<F5>", dap.continue, { desc = "Start/continue debugging" })
			vim.keymap.set("n", "<F10>", dap.step_over, { desc = "Step over" })
			vim.keymap.set("n", "<F11>", dap.step_into, { desc = "Step into" })
			vim.keymap.set("n", "<F12>", dap.step_out, { desc = "Step out" })
			vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint, { desc = "Toggle breakpoint" })
			vim.keymap.set("n", "<leader>dO", dap.step_over, { desc = "Step over (alt)" })
			vim.keymap.set("n", "<leader>dC", dap.run_to_cursor, { desc = "Run to cursor" })
			vim.keymap.set("n", "<leader>dr", dap.repl.toggle, { desc = "Toggle DAP REPL" })
			vim.keymap.set("n", "<leader>dj", dap.down, { desc = "Go down stack frame" })
			vim.keymap.set("n", "<leader>dk", dap.up, { desc = "Go up stack frame" })
		end
	}
}
