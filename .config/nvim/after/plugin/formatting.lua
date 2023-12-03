local conform = require("conform")

local formatOptions = {
	lsp_fallback = true,
	timeout_ms = 500,
}

conform.setup({
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
		lua = { "stylua" },
	},
	format_on_save = formatOptions,
})

vim.keymap.set("n", "<leader>mp", function()
	conform.format(formatOptions)
end, { desc = "Format file or range" })
