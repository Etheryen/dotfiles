require("oil").setup({
	columns = {
		"icon",
		-- "permissions",
		-- "size",
		-- "mtime",
	},
	view_options = {
		show_hidden = true,
		is_always_hidden = function(name)
			if name == ".." then
				return true
			end
			return false
		end,
	},
})

vim.keymap.set("n", "<leader>t", ":Oil<CR>", { desc = "Open Oil" })
