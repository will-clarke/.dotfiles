local spec = {
	{
		"mfussenegger/nvim-dap",
		-- TODO: Add keymaps here
		event = "VeryLazy",

		dependencies = {
			{
				"theHamsta/nvim-dap-virtual-text",
				config = function()
					require("nvim-dap-virtual-text").setup()
				end,
			},
			{
				"leoluz/nvim-dap-go",
				config = function()
					require("dap-go").setup()
				end,
			},
			{
				"rcarriga/nvim-dap-ui",
				requires = { "mfussenegger/nvim-dap" },
				config = function()
					require("dapui").setup()

					local dap, dapui = require("dap"), require("dapui")
					dap.listeners.after.event_initialized["dapui_config"] = function()
						dapui.open()
					end
					dap.listeners.before.event_terminated["dapui_config"] = function()
						dapui.close()
					end
					dap.listeners.before.event_exited["dapui_config"] = function()
						dapui.close()
					end
				end,
			},
		},
	},
}

return spec
