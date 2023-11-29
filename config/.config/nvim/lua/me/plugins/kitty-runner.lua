return {
	-- TODO: I patched this... hopefully will get fixed upstream
	-- dir = "~/code/kitty-runner.nvim",
	-- "jghauser/kitty-runner.nvim",
	"will-clarke/kitty-runner.nvim",
	config = function()
		local opts = require("kitty-runner.config").window_config
		require("kitty-runner").setup(opts)
	end,
	cmd = {
		"KittyOpenRunner",
		"KittySendLines",
		"KittyRunCommand",
		"KittyReRunCommand",
		"KittyClearRunner",
		"KittyKillRunner",
	},
}
