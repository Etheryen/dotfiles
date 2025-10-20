return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	},
	opts = {
		defaults = {
			mappings = { i = { ["<C-u>"] = false, ["<C-d>"] = false } },
			file_ignore_patterns = { "target", "tmp", "vendor", "build" },
		},
	},
	init = function()
		pcall(require("telescope").load_extension, "fzf")

		vim.keymap.set("n", "<leader>?", require("telescope.builtin").oldfiles)
		vim.keymap.set("n", "<leader><space>", require("telescope.builtin").buffers)
		vim.keymap.set("n", "<leader>/", function()
			require("telescope.builtin").current_buffer_fuzzy_find(
				require("telescope.themes").get_dropdown({ previewer = false })
			)
		end)
		vim.keymap.set("n", "<leader>sf", require("telescope.builtin").find_files)
		vim.keymap.set("n", "<leader>sg", require("telescope.builtin").live_grep)
		vim.keymap.set("n", "<leader>sd", require("telescope.builtin").diagnostics)
		vim.keymap.set("n", "<leader>sr", require("telescope.builtin").resume)
	end,
}
