return {
    {"n", "<leader><leader>h", ":Telescope help_tags<CR>", { desc = "Telescope help" }},
	{"n", "<leader>ff", ":Telescope find_files<CR>", { desc = "" }},
	{"n", "<leader>fb", ":Telescope buffers<CR>", { desc = "" }},
    {"n",  "<leader>sb", "<cmd>Telescope current_buffer_fuzzy_find<cr>", { desc = "Current Buffer" }}
}
