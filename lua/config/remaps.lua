local norm_mode = function(k, a)
	vim.keymap.set("n", k, a)
end

local insert_mode = function(k, a)
	vim.keymap.set("i", k, a)
end

local visual_mode = function(k, a)
	vim.keymap.set("v", k, a)
end

insert_mode("jj", "<ESC>")

norm_mode("<leader>pv", ":Explore<CR>")

norm_mode("\\", ":w<CR>")

visual_mode("J", ":m '>+1<CR>gv=gv")
visual_mode("K", ":m '<-2<CR>gv=gv")

norm_mode("<leader>nh", ":noh<CR>")

norm_mode("<C-u>", "<C-u>zz")
norm_mode("<C-d>", "<C-d>zz")
norm_mode("{", "{zz")
norm_mode("}", "}zz")
norm_mode("N", "Nzz")
norm_mode("n", "nzz")
norm_mode("G", "Gzz")
norm_mode("gg", "ggzz")
norm_mode("<C-i>", "<C-i>zz")
norm_mode("<C-o>", "<C-o>zz")
norm_mode("%", "%zz")
norm_mode("*", "*zz")
norm_mode("#", "#zz")

norm_mode("<left>", '<cmd>echo "Use h to move!!"<CR>')
norm_mode("<right>", '<cmd>echo "Use l to move!!"<CR>')
norm_mode("<up>", '<cmd>echo "Use k to move!!"<CR>')
norm_mode("<down>", '<cmd>echo "Use j to move!!"<CR>')

norm_mode("K", vim.lsp.buf.hover)
