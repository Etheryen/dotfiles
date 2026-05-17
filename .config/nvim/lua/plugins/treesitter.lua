local parsers = {
	"c",
	"cpp",
	"cmake",
	"ninja",
	"make",
	"java",
	"go",
	"lua",
	"python",
	"rust",
	"tsx",
	"javascript",
	"jsdoc",
	"typescript",
	"vimdoc",
	"vim",
	"bash",
	"prisma",
	"c_sharp",
	"xml",
}

return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter").install(parsers)
		require("nvim-treesitter").setup({ highlight = true })
	end,
}
