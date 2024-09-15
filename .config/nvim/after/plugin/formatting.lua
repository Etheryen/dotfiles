local conform = require("conform")

local formatOptions = {
	lsp_fallback = true,
	timeout_ms = 750,
}

conform.setup({
	formatters = {
		golines = {
			prepend_args = { "-m", "80" },
		},
	},

	formatters_by_ft = {
		typescript = { "prettierd" },
		typescriptreact = { "prettierd" },
		javascript = { "prettierd" },
		javascriptreact = { "prettierd" },
		html = { "prettierd" },
		css = { "prettierd" },
		json = { "prettierd" },
		jsonc = { "prettierd" },
		yaml = { "prettierd" },
		graphql = { "prettierd" },
		markdown = { "prettierd" },
		go = {
			"gofumpt",
			"golines",
		},
		lua = { "stylua" },
	},
	format_on_save = formatOptions,
})

vim.keymap.set("n", "<leader>mp", function()
	conform.format(formatOptions)
end, { desc = "Format file or range" })
