return {
	{
		"hrsh7th/nvim-cmp",
		dependencies = { "hrsh7th/cmp-emoji" },
		-- @param opts cmp.ConfigSchema
		opts = function(_, opts)
			vim.api.nvim_set_hl(0, "MyPmenuSel", { bg = "#45475a", fg = "#a6e3a1", bold = true })
			table.insert(opts.sources, { name = "lazydev", group_index = 0 })
			table.insert(opts.sources, { name = "emoji" })
			table.insert(opts.sources, { name = "treesitter" })
			if LazyVim.has("nvim-snippets") then
				table.insert(opts.sources, { name = "snippets" })
			end
			opts.experimental = opts.experimental or {}
			opts.experimental.ghost_text = false
			opts.window = {
				completion = {
					border = "double",
					winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,CursorLine:MyPmenuSel,Search:None",
				},
				documentation = {
					border = "double",
					winhighlight = "NormalFloat:Pmenu,FloatBorder:Pmenu,Search:None",
				},
			}
		end,
	},
}
