return {
	"nvim-lualine/lualine.nvim",
	dependencies = "nvim-tree/nvim-web-devicons",
	opts = {
		sections = {
			lualine_a = { { "mode", padding = 2 } },
			lualine_b = {
				{ "branch", padding = 2 },
				{ "diff", padding = 2 },
				{ "diagnostics", padding = 2 },
			},
			lualine_c = { { "filename", padding = 2 } },
			lualine_x = {
				{
					require("lazy.status").updates,
					cond = require("lazy.status").has_updates,
					color = { fg = "#ff9e64" },
					padding = 2,
				},
				{ "encoding", padding = 2 },
				{ "fileformat", padding = 2 },
				{ "filetype", padding = 2 },
			},
			lualine_y = { { "progress", padding = 2 } },
			lualine_z = { { "location", padding = 2 } },
		},
	},
}
