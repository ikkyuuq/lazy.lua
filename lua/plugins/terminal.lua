return {
	{
		"christoomey/vim-tmux-navigator",
		enabled = false,
		keys = {
			{ "<C-\\>", "<cmd>TmuxNavigatePrevious<cr>", desc = "Go to the previous pane" },
			{ "<C-h>", "<cmd>TmuxNavigateLeft<cr>", desc = "Got to the left pane" },
			{ "<C-j>", "<cmd>TmuxNavigateDown<cr>", desc = "Got to the down pane" },
			{ "<C-k>", "<cmd>TmuxNavigateUp<cr>", desc = "Got to the up pane" },
			{ "<C-l>", "<cmd>TmuxNavigateRight<cr>", desc = "Got to the right pane" },
		},
	},
	{
		"letieu/wezterm-move.nvim",
		enabled = false,
		keys = { -- Lazy loading, don't need call setup()
			{
				"<C-h>",
				function()
					require("wezterm-move").move("h")
				end,
			},
			{
				"<C-j>",
				function()
					require("wezterm-move").move("j")
				end,
			},
			{
				"<C-k>",
				function()
					require("wezterm-move").move("k")
				end,
			},
			{
				"<C-l>",
				function()
					require("wezterm-move").move("l")
				end,
			},
		},
	},
	{
		"knubie/vim-kitty-navigator",
		enabled = true,
		keys = {
			{ "<C-h>", "<cmd>KittyNavigateLeft<cr>", desc = "Got to the left pane" },
			{ "<C-j>", "<cmd>KittyNavigateDown<cr>", desc = "Got to the down pane" },
			{ "<C-k>", "<cmd>KittyNavigateUp<cr>", desc = "Got to the up pane" },
			{ "<C-l>", "<cmd>KittyNavigateRight<cr>", desc = "Got to the right pane" },
		},
	},
}
