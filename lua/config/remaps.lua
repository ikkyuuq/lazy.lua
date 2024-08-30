-- Helper functions for setting keymaps
local function set_keymap(mode, key, action, opts)
	vim.keymap.set(mode, key, action, opts or {})
end

local function set_normal_keymap(key, action, opts)
	set_keymap("n", key, action, opts)
end

local function set_insert_keymap(key, action, opts)
	set_keymap("i", key, action, opts)
end

local function set_visual_keymap(key, action, opts)
	set_keymap("v", key, action, opts)
end

-- Basic mode switching
set_insert_keymap("jk", "<ESC>")

-- File explorer
set_normal_keymap("<leader>pv", ":Explore<CR>")

-- Navigation
local navigation_mappings = {
	{ "<A-h>", "^" },
	{ "<A-l>", "$" },
}

for _, mapping in ipairs(navigation_mappings) do
	set_normal_keymap(unpack(mapping))
end

-- Line movement
local line_movement_mappings = {
	{ "<A-j>", "<cmd>m .+1<cr>==", "n" },
	{ "<A-k>", "<cmd>m .-2<cr>==", "n" },
	{ "<A-j>", "<esc><cmd>m .+1<cr>==gi", "i" },
	{ "<A-k>", "<esc><cmd>m .-2<cr>==gi", "i" },
	{ "<A-j>", ":m '>+1<cr>gv=gv", "v" },
	{ "<A-k>", ":m '<-2<cr>gv=gv", "v" },
}

for _, mapping in ipairs(line_movement_mappings) do
	set_keymap(mapping[3], mapping[1], mapping[2])
end

-- Window management
local window_mappings = {
	{ "<A-,>", "<c-w>5<" },
	{ "<A-.>", "<c-w>5>" },
	{ "<A-t>", "<c-w>+" },
	{ "<A-s>", "<c-w>-" },
	{ "<C-j>", "<C-w>j" },
	{ "<C-k>", "<C-w>k" },
	{ "<C-h>", "<C-w>h" },
	{ "<C-l>", "<C-w>l" },
}

for _, mapping in ipairs(window_mappings) do
	set_normal_keymap(unpack(mapping))
end

-- Miscellaneous normal mode mappings
local misc_normal_mappings = {
	{ "<leader>nh", ":noh<CR>" },
	{ "<C-u>", "<C-u>zz" },
	{ "<C-d>", "<C-d>zz" },
	{ "{", "{zz" },
	{ "}", "}zz" },
	{ "N", "Nzz" },
	{ "n", "nzz" },
	{ "G", "Gzz" },
	{ "gg", "ggzz" },
	{ "<C-i>", "<C-i>zz" },
	{ "<C-o>", "<C-o>zz" },
	{ "%", "%zz" },
	{ "*", "*zz" },
	{ "#", "#zz" },
	{ "<left>", '<cmd>echo "Use h to move!!"<CR>' },
	{ "<right>", '<cmd>echo "Use l to move!!"<CR>' },
	{ "<up>", '<cmd>echo "Use k to move!!"<CR>' },
	{ "<down>", '<cmd>echo "Use j to move!!"<CR>' },
	{ "<S-k>", vim.lsp.buf.hover },
}

for _, mapping in ipairs(misc_normal_mappings) do
	set_normal_keymap(unpack(mapping))
end

-- Debugging mappings
local debug_mappings = {
	{ "<F1>", ":lua require'dap'.continue()<CR>" },
	{ "<F2>", ":lua require'dap'.step_into()<CR>" },
	{ "<F3>", ":lua require'dap'.step_over()<CR>" },
	{ "<F4>", ":lua require'dap'.step_out()<CR>" },
	{ "<F5>", ":lua require'dap'.step_back()<CR>" },
	{ "<F12>", ":lua require'dap'.restart()<CR>" },
	{ "<leader>dT", ":lua require'dap-go'.debug_test()<CR>" },
}

for _, mapping in ipairs(debug_mappings) do
	set_normal_keymap(unpack(mapping))
end
