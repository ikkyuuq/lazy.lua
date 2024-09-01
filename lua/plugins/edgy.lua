return {
	"folke/edgy.nvim",
	optional = true,
	opts = function(_, opts)
		opts.right = opts.right or {}
		table.insert(opts.right, {
			title = "Overseer",
			ft = "OverseerList",
			open = function()
				require("overseer").open()
			end,
		})
	end,
}
