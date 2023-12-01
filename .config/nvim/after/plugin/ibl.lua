-- Enable `lukas-reineke/indent-blankline.nvim`
-- See `:help ibl`

-- COLORS MADE TO FIT rose-pine
local hooks = require("ibl.hooks")
hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
	vim.api.nvim_set_hl(0, "RosePineIndentColor", { fg = "#26233a" })
	vim.api.nvim_set_hl(0, "RosePineIndentColorScope", { fg = "#524f67" })
end)

require("ibl").setup({
	indent = {
		-- 	-- char = "▏",
		highlight = "RosePineIndentColor",
	},
	scope = {
		highlight = "RosePineIndentColorScope",
	},
})
