return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"williamboman/mason.nvim",
		"jay-babu/mason-nvim-dap.nvim",
		{
			"rcarriga/nvim-dap-ui",
			dependencies = { "nvim-neotest/nvim-nio" },
		},
	},
	config = function()
		local dap = require("dap")
		local dapui = require("dapui")
		local mason_dap = require("mason-nvim-dap")

		-----------------------------------------------------------------------
		-- 1. APPEARANCE & ICONS
		-----------------------------------------------------------------------
		local signs = {
			DapBreakpoint = { text = "●", texthl = "DapBreakpoint" },
			DapBreakpointCondition = { text = "●", texthl = "DapBreakpointCondition" },
			DapLogPoint = { text = "◆", texthl = "DapLogPoint" },
			DapStopped = { text = "▶", texthl = "DapStopped", linehl = "DapStoppedLine" },
			DapBreakpointRejected = { text = "", texthl = "DapBreakpoint" },
		}

		for type, icon in pairs(signs) do
			vim.fn.sign_define(type, icon)
		end

		vim.api.nvim_set_hl(0, "DapBreakpoint", { fg = "#e51400" })
		vim.api.nvim_set_hl(0, "DapBreakpointCondition", { fg = "#e5c07b" })
		vim.api.nvim_set_hl(0, "DapLogPoint", { fg = "#61afef" })
		vim.api.nvim_set_hl(0, "DapStopped", { fg = "#98c379" })
		vim.api.nvim_set_hl(0, "DapStoppedLine", { bg = "#31353f" })

		-----------------------------------------------------------------------
		-- 2. DAP UI SETUP
		-----------------------------------------------------------------------
		dapui.setup({
			layouts = {
				{
					elements = {
						{ id = "scopes",  size = 0.5 },
						{ id = "watches", size = 0.2 },
						{ id = "stacks",  size = 0.3 },
					},
					size = 40,
					position = "left",
				},
				{
					elements = {
						{ id = "repl",    size = 0.5 },
						{ id = "console", size = 0.5 },
					},
					size = 10,
					position = "bottom",
				},
			},
			mappings = {
				edit = { "e", "i" },
				expand = { "<CR>", "<2-LeftMouse>" },
				open = "o",
				remove = "d",
				repl = "r",
				toggle = "t",
			},
			controls = { enabled = true },
			floating = { border = "rounded" },
		})

		dap.listeners.after.event_initialized["dapui_config"] = function()
			dapui.open()
		end

		-----------------------------------------------------------------------
		-- 3. ADAPTER SETUP (NETCOREDBG)
		-----------------------------------------------------------------------
		mason_dap.setup({
			ensure_installed = { "coreclr" },
			automatic_installation = true,
			handlers = {},
		})

		if not dap.adapters.coreclr then
			dap.adapters.coreclr = {
				type = "executable",
				command = vim.fn.stdpath("data") .. "/mason/bin/netcoredbg",
				args = { "--interpreter=vscode" },
			}
		end

		-----------------------------------------------------------------------
		-- 4. .NET CONFIGURATION (DLL PICKER)
		-----------------------------------------------------------------------
		local function get_dll_path()
			local cwd = vim.fn.getcwd()
			local dll_candidates = vim.fn.glob(cwd .. "/bin/Debug/**/*.dll", true, true)
			local valid_dlls = {}
			for _, path in ipairs(dll_candidates) do
				if not string.find(path, "ref/") and not string.find(path, "runtimes/") then
					table.insert(valid_dlls, path)
				end
			end

			if #valid_dlls == 0 then
				return vim.fn.input("Path to dll: ", vim.fn.getcwd() .. "/bin/Debug/", "file")
			elseif #valid_dlls == 1 then
				return valid_dlls[1]
			else
				return coroutine.create(function(dap_run_co)
					vim.ui.select(valid_dlls, {
						prompt = "Select DLL to debug:",
						format_item = function(item)
							return vim.fn.fnamemodify(item, ":t") ..
							    " (" .. vim.fn.fnamemodify(item, ":h") .. ")"
						end,
					}, function(choice)
						coroutine.resume(dap_run_co, choice)
					end)
				end)
			end
		end

		dap.configurations.cs = {
			{
				type = "coreclr",
				name = "Launch - netcoredbg",
				request = "launch",
				program = get_dll_path,
				env = {
					ASPNETCORE_ENVIRONMENT = "Development",
				},
			},
			{
				type = "coreclr",
				name = "Attach - Process Picker",
				request = "attach",
				processId = require("dap.utils").pick_process,
			},
		}

		-----------------------------------------------------------------------
		-- 5. HELPER FUNCTIONS (AZURE & JUMP)
		-----------------------------------------------------------------------
		local debug_state = { terminal_buf = nil, terminal_win = nil, original_win = nil }

		local function is_valid_func_project(dir)
			return vim.fn.filereadable(dir .. "/host.json") == 1 and
			    #vim.fn.glob(dir .. "/*.csproj", true, true) > 0
		end

		local function start_azure_func_host()
			if debug_state.terminal_buf and vim.api.nvim_buf_is_valid(debug_state.terminal_buf) then
				vim.notify("Azure Functions Host is already running.", vim.log.levels.INFO)
				return
			end
			local cwd = vim.fn.getcwd()
			local project_dir = is_valid_func_project(cwd) and cwd or nil
			if not project_dir then
				local candidates = vim.fn.glob(cwd .. "/**/host.json", true, true)
				for _, path in ipairs(candidates) do
					if not path:match("/bin/") and not path:match("/obj/") then
						local dir = vim.fn.fnamemodify(path, ":h")
						if is_valid_func_project(dir) then
							project_dir = dir
							break
						end
					end
				end
			end
			if not project_dir then
				vim.notify("No Azure Functions project found.", vim.log.levels.WARN)
				return
			end
			local port = "7071"
			local launch_settings_path = project_dir .. "/Properties/launchSettings.json"
			local f = io.open(launch_settings_path, "r")
			if f then
				local content = f:read("*all")
				f:close()
				port = content:match("%-%-port%s+(%d+)") or port
			end
			debug_state.original_win = vim.api.nvim_get_current_win()
			debug_state.terminal_buf = vim.api.nvim_create_buf(false, true)
			vim.api.nvim_buf_call(debug_state.terminal_buf, function()
				vim.fn.termopen(
					"cd '" ..
					project_dir ..
					"' && func host start --port " .. port .. " --dotnet-isolated-debug"
				)
			end)
			vim.notify("Started Azure Func Host on port " .. port, vim.log.levels.INFO)
		end

		local function cleanup_debug()
			if dap.session() then
				dap.terminate()
			end
			dapui.close()
			dap.repl.close()
			if debug_state.terminal_buf and vim.api.nvim_buf_is_valid(debug_state.terminal_buf) then
				vim.api.nvim_buf_delete(debug_state.terminal_buf, { force = true })
			end
			debug_state = { terminal_buf = nil, terminal_win = nil, original_win = nil }
			vim.notify("Debug session closed.", vim.log.levels.INFO)
		end

		local function jump_to_cursor()
			local session = dap.session()
			if not session then
				return
			end

			-- Ensure we are paused
			if not session.stopped_thread_id then
				vim.notify("Cannot jump: Debugger is not paused.", vim.log.levels.WARN)
				return
			end

			-- 1. Get the source from the current frame to ensure exact path match with debugger
			-- (Using vim.fn.expand("%:p") can fail if casing differs on Windows/Mac)
			local current_source = nil
			if session.current_frame and session.current_frame.source then
				current_source = session.current_frame.source
			else
				current_source = { path = vim.fn.expand("%:p") }
			end

			local target_line = vim.fn.line(".")

			-- 2. Ask debugger if we can jump there
			session:request("gotoTargets", {
				source = current_source,
				line = target_line,
			}, function(err, response)
				if err then
					-- Detect the specific .NET "Not Implemented" error
					if err.message and string.find(err.message, "0x80004001") then
						vim.notify(
							"JUMP FAILED: .NET cannot set next statement here.\n\nCommon causes:\n1. You are inside an 'async' method (state machine limitation)\n2. You are debugging a 'Release' build\n3. You are inside a 'catch' or 'finally' block",
							vim.log.levels.ERROR
						)
					else
						vim.notify("Jump Request Failed: " .. (err.message or "Unknown"),
							vim.log.levels.ERROR)
					end
					return
				end

				if not response.targets or #response.targets == 0 then
					vim.notify("No executable code found on line " .. target_line,
						vim.log.levels.WARN)
					return
				end

				-- 3. Execute the jump
				local target_id = response.targets[1].id
				session:request("goto", {
					threadId = session.current_thread_id or session.stopped_thread_id,
					targetId = target_id,
				}, function(err_goto, _)
					if err_goto then
						vim.notify("Jump Execution Failed: " .. err_goto.message,
							vim.log.levels.ERROR)
					else
						-- Optional: Silent success or minimal notification
						-- vim.notify("Jumped to line " .. target_line, vim.log.levels.INFO)
					end
				end)
			end)
		end

		-----------------------------------------------------------------------
		-- 6. KEYMAPS
		-----------------------------------------------------------------------

		vim.keymap.set("n", "<Leader>dc", dap.continue, { desc = "DAP: Continue / Start" })
		vim.keymap.set("n", "<Leader>dr", dap.restart_frame, { desc = "DAP: Restart Frame" })
		vim.keymap.set("n", "<Right>", dap.step_into, { desc = "DAP: Step Into" })
		vim.keymap.set("n", "<Down>", dap.step_over, { desc = "DAP: Step Over" })
		vim.keymap.set("n", "<Left>", dap.step_out, { desc = "DAP: Step Out" })
		vim.keymap.set("n", "<Leader>dl", dap.run_last, { desc = "DAP: Run Last Config" })

		vim.keymap.set("n", "<Leader>b", dap.toggle_breakpoint, { desc = "DAP: Toggle Breakpoint" })
		vim.keymap.set("n", "<Leader>B", function()
			dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
		end, { desc = "DAP: Set Conditional Breakpoint" })
		vim.keymap.set("n", "<Leader>lp", function()
			dap.set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
		end, { desc = "DAP: Set Log Point" })

		-- Use the custom local function here
		vim.keymap.set("n", "<Leader>dj", jump_to_cursor, { desc = "DAP: Jump to Cursor (Set Next Statement)" })

		vim.keymap.set("n", "<Leader>du", dapui.toggle, { desc = "DAP: Toggle UI" })
		vim.keymap.set({ "n", "v" }, "<Leader>de", dapui.eval, { desc = "DAP: Eval Expression" })

		vim.keymap.set("n", "<Leader>dt", dap.terminate, { desc = "DAP: Terminate" })
		vim.keymap.set("n", "<Leader>dq", cleanup_debug, { desc = "DAP: Cleanup & Quit" })
		vim.keymap.set("n", "<Leader>dh", start_azure_func_host, { desc = "DAP: Start Azure Host" })
	end,
}
