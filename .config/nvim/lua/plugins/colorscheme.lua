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

-- return { "ellisonleao/gruvbox.nvim", priority = 1000, config = true, opts = ... }
-- return {
-- 	"ellisonleao/gruvbox.nvim",
-- 	lazy = false,
-- 	priority = 1000,
-- 	config = true,
-- 	opts = {},
-- 	init = function()
-- 		vim.cmd.colorscheme("gruvbox")
-- 	end,
-- }
--
-- return {
-- 	"blazkowolf/gruber-darker.nvim",
-- 	lazy = false,
-- 	priority = 1000,
-- 	config = true,
-- 	opts = {},
-- 	init = function()
-- 		vim.cmd.colorscheme("gruber-darker")
-- 	end,
-- }
