return {
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-emoji",
			"f3fora/cmp-spell",
			"ray-x/cmp-treesitter",
			"L3MON4D3/LuaSnip",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"saadparwaiz1/cmp_luasnip",
			"onsails/lspkind.nvim",
			"roobert/tailwindcss-colorizer-cmp.nvim",
		},
		opts = function(_, opts)
			vim.api.nvim_set_hl(0, "FloatBorder", { link = "Normal" })
			opts.performance = { debounce = 0, throttle = 0 }
			local cmp = require("cmp")
			local lspkind = require("lspkind")
			local cmp_tailwind = require("tailwindcss-colorizer-cmp")
			-- Customization for Pmenu
			vim.api.nvim_set_hl(0, "PmenuSel", { bg = "#2a2837", fg = "NONE" })
			vim.api.nvim_set_hl(0, "Pmenu", { fg = "#e0def4", bg = "#1f1d2e" })

			vim.api.nvim_set_hl(0, "CmpItemAbbrDeprecated", { fg = "#908caa", bg = "NONE", strikethrough = true })
			vim.api.nvim_set_hl(0, "CmpItemAbbrMatch", { fg = "#c4a7e7", bg = "NONE", bold = true })
			vim.api.nvim_set_hl(0, "CmpItemAbbrMatchFuzzy", { fg = "#c4a7e7", bg = "NONE", bold = true })
			vim.api.nvim_set_hl(0, "CmpItemMenu", { fg = "#ebbcba", bg = "NONE", italic = true })

			vim.api.nvim_set_hl(0, "CmpItemKindField", { fg = "#1f1d2e", bg = "#ebbcba" })
			vim.api.nvim_set_hl(0, "CmpItemKindProperty", { fg = "#1f1d2e", bg = "#ebbcba" })
			vim.api.nvim_set_hl(0, "CmpItemKindEvent", { fg = "#1f1d2e", bg = "#ebbcba" })

			vim.api.nvim_set_hl(0, "CmpItemKindText", { fg = "#1f1d2e", bg = "#9ccfd8" })
			vim.api.nvim_set_hl(0, "CmpItemKindEnum", { fg = "#1f1d2e", bg = "#9ccfd8" })
			vim.api.nvim_set_hl(0, "CmpItemKindKeyword", { fg = "#1f1d2e", bg = "#9ccfd8" })

			vim.api.nvim_set_hl(0, "CmpItemKindConstant", { fg = "#1f1d2e", bg = "#f6c177" })
			vim.api.nvim_set_hl(0, "CmpItemKindConstructor", { fg = "#1f1d2e", bg = "#f6c177" })
			vim.api.nvim_set_hl(0, "CmpItemKindReference", { fg = "#1f1d2e", bg = "#f6c177" })

			vim.api.nvim_set_hl(0, "CmpItemKindFunction", { fg = "#1f1d2e", bg = "#c4a7e7" })
			vim.api.nvim_set_hl(0, "CmpItemKindStruct", { fg = "#1f1d2e", bg = "#c4a7e7" })
			vim.api.nvim_set_hl(0, "CmpItemKindClass", { fg = "#1f1d2e", bg = "#c4a7e7" })
			vim.api.nvim_set_hl(0, "CmpItemKindModule", { fg = "#1f1d2e", bg = "#c4a7e7" })
			vim.api.nvim_set_hl(0, "CmpItemKindOperator", { fg = "#1f1d2e", bg = "#c4a7e7" })

			vim.api.nvim_set_hl(0, "CmpItemKindVariable", { fg = "#e0def4", bg = "#26233a" })
			vim.api.nvim_set_hl(0, "CmpItemKindFile", { fg = "#e0def4", bg = "#26233a" })

			vim.api.nvim_set_hl(0, "CmpItemKindUnit", { fg = "#1f1d2e", bg = "#eb6f92" })
			vim.api.nvim_set_hl(0, "CmpItemKindSnippet", { fg = "#1f1d2e", bg = "#eb6f92" })
			vim.api.nvim_set_hl(0, "CmpItemKindFolder", { fg = "#1f1d2e", bg = "#eb6f92" })

			vim.api.nvim_set_hl(0, "CmpItemKindMethod", { fg = "#1f1d2e", bg = "#31748f" })
			vim.api.nvim_set_hl(0, "CmpItemKindValue", { fg = "#1f1d2e", bg = "#31748f" })
			vim.api.nvim_set_hl(0, "CmpItemKindEnumMember", { fg = "#1f1d2e", bg = "#31748f" })

			vim.api.nvim_set_hl(0, "CmpItemKindInterface", { fg = "#1f1d2e", bg = "#9ccfd8" })
			vim.api.nvim_set_hl(0, "CmpItemKindColor", { fg = "#1f1d2e", bg = "#9ccfd8" })
			vim.api.nvim_set_hl(0, "CmpItemKindTypeParameter", { fg = "#1f1d2e", bg = "#9ccfd8" })
			cmp.setup({
				preselect = cmp.PreselectMode.Item,

				keyword_length = 2,
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
					end,
				},
				sources = {
					{ name = "emoji", group_index = 5 },
					{ name = "lazydev", keyword_length = 2, group_index = 0 },
					{ name = "nvim_lsp", group_index = 2 },
					{ name = "treesitter", keyword_length = 4, group_index = 4 },
					{ name = "path", keyword_length = 4, group_index = 4 },
					{
						name = "buffer",
						keyword_length = 3,
						group_index = 5,
						option = {
							get_bufnrs = function()
								local bufs = {}
								for _, win in ipairs(vim.api.nvim_list_wins()) do
									bufs[vim.api.nvim_win_get_buf(win)] = true
								end
								return vim.tbl_keys(bufs)
							end,
						},
					},
					{
						name = "spell",
						group_index = 5,
						option = {
							keep_all_entries = false,
							enable_in_context = function()
								return true
							end,
							preselect_correct_word = true,
						},
					},
				},
				view = {
					entries = { name = "custom", selection_order = "near_cursor", follow_cursor = true },
				},
				sorting = {
					priority_weight = 2,
					comparators = {
						cmp.config.compare.offset,
						cmp.config.compare.exact,
						cmp.config.compare.score,
						cmp.config.compare.recently_used,
						cmp.config.compare.kind,
						cmp.config.compare.sort_text,
						cmp.config.compare.length,
						cmp.config.compare.order,
					},
				},
			})
			cmp.setup.filetype({ "markdown" }, {
				sources = { { name = "spell" }, { name = "emoji" }, { name = "buffer" } },
			})
			cmp.setup.filetype({ "sql" }, {
				sources = { { name = "vim-dadbod-completion" }, { name = "buffer" } },
			})
			if LazyVim.has("nvim-snippets") then
				table.insert(opts.sources, { name = "snippets" })
			end
			opts.experimental = opts.experimental or {}
			opts.experimental.ghost_text = false
			opts.window = {
				completion = {
					winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
					maxwidth = 20,
					col_offset = -3,
					side_padding = 0,
				},
				documentation = {
					winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
				},
			}
			opts.formatting = {
				fields = { "kind", "abbr", "menu" },
				format = function(entry, vim_item)
					local item = lspkind.cmp_format({
						mode = "symbol_text",
						maxwidth = 50,
						ellipsis_char = "...",
					})(entry, vim_item)
					local strings = vim.split(item.kind, "%s", { trimempty = true })
					item.kind = " " .. (strings[1] or "") .. " "
					item.menu = "    (" .. (strings[2] or "") .. ")"

					return cmp_tailwind.formatter(entry, item)
				end,
			}
		end,
	},
}
