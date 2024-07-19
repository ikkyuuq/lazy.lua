return {
	"mistricky/codesnap.nvim",
	build = "make build_generator",
	keys = {
		{ "<leader>c+", "<cmd>CodeSnap<cr>", mode = "x", desc = "Save selected code snapshot into clipboard" },
		{
			"<leader>cs",
			"<cmd>CodeSnapSave<cr>",
			mode = "x",
			desc = "Save selected code snapshot in ~/Pictures/CodeSnap",
		},
	},
	opts = {
		save_path = "~/Pictures/CodeSnap",
		has_breadcrumbs = true,
		watermark = "",
		min_width = 640,
	},
}
