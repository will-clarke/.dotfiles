return {
	"rcarriga/nvim-dap-ui",
	dependencies = {
		"mfussenegger/nvim-dap",
		"leoluz/nvim-dap-go",
	},
	event = "VeryLazy",
	config = function()
		local dap_go_ok, dap_go = pcall(require, "dap-go")
		if not dap_go_ok then
			vim.notify("dap-go not found", vim.log.levels.ERROR)
			return
		end
		dap_go.setup()

		local dap_ok, dap = pcall(require, "dap")
		if not dap_ok then
			vim.notify("dap not found", vim.log.levels.ERROR)
			return
		end
		local dapui_ok, dapui = pcall(require, "dapui")
		if not dapui_ok then
			vim.notify("dapui not found", vim.log.levels.ERROR)
			return
		end

		dapui.setup()

		dap.listeners.after.event_initialized["dapui_config"] = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated["dapui_config"] = function()
			dapui.close()
		end
		dap.listeners.before.event_exited["dapui_config"] = function()
			dapui.close()
		end

		-- dap.adapters.delve = {
		-- 	type = "server",
		-- 	port = "${port}",
		-- 	executable = {
		-- 		command = "dlv",
		-- 		args = { "dap", "-l", "127.0.0.1:${port}" },
		-- 	},
		-- }

		-- https://github.com/go-delve/delve/blob/master/Documentation/usage/dlv_dap.md
		-- dap.configurations.go = {
		-- 	{
		-- 		type = "delve",
		-- 		name = "Debug",
		-- 		request = "launch",
		-- 		program = "${file}",
		-- 	},
		-- 	{
		-- 		type = "delve",
		-- 		name = "Debug test", -- configuration for debugging test files
		-- 		request = "launch",
		-- 		mode = "test",
		-- 		program = "${file}",
		-- 	},
		-- 	-- works with go.mod packages and sub packages
		-- 	{
		-- 		type = "delve",
		-- 		name = "Debug test (go.mod)",
		-- 		request = "launch",
		-- 		mode = "test",
		-- 		program = "./${relativeFileDirname}",
		-- 	},
		-- }
	end,
}
