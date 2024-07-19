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

norm_mode("<A-h>", "<cmd>bprevious<cr>")
norm_mode("<A-l>", "<cmd>bnext<cr>")

norm_mode("<A-j>", "<cmd>m .+1<cr>==")
norm_mode("<A-k>", "<cmd>m .-2<cr>==")

insert_mode("<A-j>", "<esc><cmd>m .+1<cr>==gi")
insert_mode("<A-k>", "<esc><cmd>m .-2<cr>==gi")
visual_mode("<A-j>", ":m '>+1<cr>gv=gv")
visual_mode("<A-k>", ":m '<-2<cr>gv=gv")

norm_mode("<leader>nh", ":noh<CR>")
norm_mode("<C-a>", "ggVG")

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

norm_mode("<C-k>", "<C-w>k")
norm_mode("<C-j>", "<C-w>j")
norm_mode("<C-h>", "<C-w>h")
norm_mode("<C-l>", "<C-w>l")

norm_mode("<left>", '<cmd>echo "Use h to move!!"<CR>')
norm_mode("<right>", '<cmd>echo "Use l to move!!"<CR>')
norm_mode("<up>", '<cmd>echo "Use k to move!!"<CR>')
norm_mode("<down>", '<cmd>echo "Use j to move!!"<CR>')

norm_mode("K", vim.lsp.buf.hover)
