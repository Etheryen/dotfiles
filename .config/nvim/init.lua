-- List of available colorschemes in lua/colorscheme.lua
GLOBAL_COLORSCHEME = "rose-pine"

require("options")
require("plugins")

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
	group = highlight_group,
	pattern = "*",
})

-- document existing key chains
-- require("which-key").register({
-- 	["<leader>c"] = { name = "[C]ode", _ = "which_key_ignore" },
-- 	["<leader>d"] = { name = "[D]ocument", _ = "which_key_ignore" },
-- 	["<leader>g"] = { name = "[G]it", _ = "which_key_ignore" },
-- 	["<leader>h"] = { name = "More git", _ = "which_key_ignore" },
-- 	["<leader>r"] = { name = "[R]ename", _ = "which_key_ignore" },
-- 	["<leader>s"] = { name = "[S]earch", _ = "which_key_ignore" },
-- 	["<leader>w"] = { name = "[W]orkspace", _ = "which_key_ignore" },
-- })

require("which-key").add({
	{ "<leader>c", group = "[C]ode" },
	{ "<leader>d", group = "[D]ocument" },
	{ "<leader>g", group = "[G]it" },
	{ "<leader>h", group = "More git" },
	{ "<leader>r", group = "[R]ename" },
	{ "<leader>s", group = "[S]earch" },
	{ "<leader>w", group = "[W]orkspace" },
})

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
