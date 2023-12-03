require("nvim-tree").setup({
	view = {
		number = true,
		relativenumber = true,
		width = 50,
	},
	actions = {
		open_file = {
			quit_on_open = true,
		},
	},
})

vim.keymap.set(
	"n",
	"<leader>t",
	-- ":e .<CR>",
	function()
		require("nvim-tree.api").tree.toggle()
	end,
	{ desc = "Toggle nvim-tree" }
)
