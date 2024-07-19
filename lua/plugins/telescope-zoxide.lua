return {
	"jvgrootveld/telescope-zoxide",
	dependencies = {
		"nvim-telescope/telescope.nvim",
	},
	lazy = true,
	opts = {},
	keys = {
		{ "<leader>fz", "<Cmd>Telescope zoxide list<CR>", desc = "Find directories" },
	},
}
