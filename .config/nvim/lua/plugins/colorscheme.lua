return {
	"catppuccin/nvim",
	name = "catppuccin",
	lazy = false,
	priority = 1000,
	opts = {
		flavour = "mocha",
		no_italic = true,
		no_bold = true,
		float = { solid = true, transparent = false },
	},
	init = function()
		vim.cmd.colorscheme("catppuccin")
	end,
}
