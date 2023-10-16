return  {
	-- better up/down
	{{ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true }},
	{{ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true }},

	-- Move to window using the <ctrl> hjkl keys
	-- {"n", "<C-h>", "<C-w>h", { desc = "Go to left window", remap = true }},
	-- {"n", "<C-j>", "<C-w>j", { desc = "Go to lower window", remap = true }},
	-- {"n", "<C-k>", "<C-w>k", { desc = "Go to upper window", remap = true }},
	-- {"n", "<C-l>", "<C-w>l", { desc = "Go to right window", remap = true }},

	-- Insert New Line Above/Below
	{"n", "<leader>o", "o<C-c>k", { desc = "Insert Line Below" }},
	{"n", "<leader>O", "o<C-c>j", { desc = "Insert Line Above" }},

	-- Next/Prev Buffer
	{"n", "<C-k>", "<cmd>bprevious<cr>", { desc = "Prev buffer" }},
	{"n", "<C-j>", "<cmd>bnext<cr>", { desc = "Next buffer" }},

	-- Move Lines
	{"n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move down" }},
	{"n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move up" }},
	{"i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" }},
	{"i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" }},
	{"v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move down" }},
	{"v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move up" }},

	-- Execute File
	{"n", "<leader><leader>x", ":w<cr>:source %<cr>", { desc = "Execute Current File" }},
}
