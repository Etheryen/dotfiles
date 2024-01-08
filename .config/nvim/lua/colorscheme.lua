local colorschemes = {
	["rose-pine"] = {
		"rose-pine/neovim",
		name = "rose-pine",
		priority = 1000,
		config = function()
			require("rose-pine").setup({
				styles = {
					bold = false,
					italic = false,
					transparency = false,
				},
			})
			vim.cmd.colorscheme("rose-pine")
		end,
	},
	["nord"] = {
		"shaunsingh/nord.nvim",
		name = "nord",
		priority = 1000,
		config = function()
			vim.g.nord_italic = false
			vim.g.nord_bold = false
			vim.cmd.colorscheme("nord")
		end,
	},
	["catppuccin"] = {
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			require("catppuccin").setup({
				no_italic = true,
			})
			vim.cmd.colorscheme("catppuccin")
		end,
	},
	["gruvbox"] = {
		"ellisonleao/gruvbox.nvim",
		name = "gruvbox",
		priority = 1000,
		config = function()
			require("gruvbox").setup({
				bold = false,
				italic = {
					folds = false,
					strings = false,
					comments = false,
					emphasis = false,
					operators = false,
				},
				overrides = {
					SignColumn = { bg = "#282828" },
				},
			})
			vim.o.background = "dark"
			vim.cmd.colorscheme("gruvbox")
		end,
	},
	["onedark"] = {
		"navarasu/onedark.nvim",
		name = "onedark",
		priority = 1000,
		config = function()
			require("onedark").setup({
				code_style = {
					comments = "none",
					keywords = "none",
					functions = "none",
					strings = "none",
					variables = "none",
				},
			})
			vim.cmd.colorscheme("onedark")
		end,
	},
	["kanagawa"] = {
		"rebelot/kanagawa.nvim",
		name = "kanagawa",
		priority = 1000,
		config = function()
			require("kanagawa").setup({
				commentStyle = { italic = false },
				keywordStyle = { italic = false },
				statementStyle = { bold = false },
				colors = {
					theme = {
						wave = {
							ui = {
								bg_gutter = "none",
							},
						},
					},
				},
			})
			vim.cmd.colorscheme("kanagawa")
		end,
	},
	["github"] = {
		"projekt0n/github-nvim-theme",
		name = "github-theme",
		priority = 1000,
		config = function()
			require("github-theme").setup({})
			vim.cmd.colorscheme("github_dark_default")
		end,
	},
}

return colorschemes[GLOBAL_COLORSCHEME]
