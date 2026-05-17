return {
	"catppuccin/nvim",
	name = "catppuccin",
	lazy = false,
	priority = 1000,
	opts = { float = { solid = true } },
	init = function()
		vim.cmd.colorscheme("catppuccin-nvim")
	end,
}
