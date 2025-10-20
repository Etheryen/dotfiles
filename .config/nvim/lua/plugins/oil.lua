return {
	"stevearc/oil.nvim",
	dependencies = { "nvim-mini/mini.icons" },
	lazy = false,
	opts = {
		view_options = {
			show_hidden = true,
			is_always_hidden = function(name)
				return name == ".."
			end,
		},
	},
	init = function()
		vim.keymap.set("n", "<leader>t", "<cmd>Oil<CR>")
	end,
}
