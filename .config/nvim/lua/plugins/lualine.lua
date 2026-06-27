return {
	"nvim-lualine/lualine.nvim",
	-- dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		options = {
			icons_enabled = false,
			globalstatus = true,
			-- component_separators = { left = "", right = "" },
			-- section_separators = { left = "", right = "" },
			-- section_separators = "",
			-- component_separators = "⧸",
			-- section_separators = "",
			-- component_separators = "│",
			section_separators = "",
			component_separators = "",
		},
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
					fmt = function(str)
						return "updates: " .. str:sub(5)
					end,
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
