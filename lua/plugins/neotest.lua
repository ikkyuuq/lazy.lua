return {
	"nvim-neotest/neotest",
	dependencies = {
		"nvim-neotest/nvim-nio",
		"nvim-lua/plenary.nvim",
		"antoinemadec/FixCursorHold.nvim",
		"nvim-treesitter/nvim-treesitter",
		"mfussenegger/nvim-dap",
	},
	optional = true,
	opts = function(_, opts)
		opts = opts or {}
		opts.consumers = opts.consumers or {}
		opts.consumers.overseer = require("neotest.consumers.overseer")
		return opts
	end,
}
