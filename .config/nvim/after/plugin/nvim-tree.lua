require("nvim-tree").setup({
	actions = {
		open_file = {
			quit_on_open = true,
		},
	},
})

vim.keymap.set("n", "<leader>t", function()
	require("nvim-tree.api").tree.toggle()
end, { desc = "Toggle nvim-tree" })
