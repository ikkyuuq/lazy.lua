return {
	"L3MON4D3/LuaSnip",
	config = function()
		local ls = require("luasnip")

		-- TheKittipongpars custom snippet
		local s = ls.snippet
		local t = ls.text_node
		local i = ls.insert_node
		local a = ls.add_snippets
		local extras = require("luasnip.extras")
		local rep = extras.rep
		a("lua", {
			s("asnip", {
				t('ls.add_snippets("'),
				i(1),
				t({ '", {', "\t" }),
				t('ls.snippet("'),
				i(2),
				t({ '", {', "\t" }),
				t({ "", "\t" }),
				i(0),
				t({ "})", "\t" }),
				t("})"),
			}),
		})
		a("go", {
			s("hello", {
				t('fmt.Println("Hello, World!")'),
			}),
		})
		a("go", {
			s("ifterr", {
				t("if "),
				i(1),
				t(" != "),
				i(2),
				t({ " {", "\t" }),
				t('t.Errorf("'),
				rep(1),
				t(" %#v "),
				rep(2),
				t(' %#v", '),
				rep(1),
				t(", "),
				rep(2),
				t({ ")", "\t" }),
				t("}"),
			}),
		})
	end,
}
