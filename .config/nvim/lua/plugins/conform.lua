local formatters_by_ft = {
	cs = { "csharpier" },
	css = { "prettierd" },
	go = { "gofumpt", "golines" },
	graphql = { "prettierd" },
	html = { "prettierd" },
	java = { "google-java-format" },
	javascript = { "prettierd" },
	javascriptreact = { "prettierd" },
	json = { "prettierd" },
	jsonc = { "prettierd" },
	lua = { "stylua" },
	markdown = { "prettierd" },
	python = { "ruff_fix", "ruff_format", "ruff_organize_imports" },
	typescript = { "prettierd" },
	typescriptreact = { "prettierd" },
	xml = { "csharpier" },
	yaml = { "prettierd" },
}

local config_tweaks = { golines = { prepend_args = { "-m", "80" } } }

return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	opts = {
		formatters = config_tweaks,
		formatters_by_ft = formatters_by_ft,
		format_on_save = function(bufnr)
			if vim.bo[bufnr].filetype == "java" then
				return
			end
			return { lsp_fallback = true, timeout_ms = 1000 }
		end,
		notify_on_error = false,
	},
}
