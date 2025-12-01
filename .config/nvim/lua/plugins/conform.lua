local formatters_by_ft = {
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
	go = { "gofumpt", "golines" },
	lua = { "stylua" },
	java = { "google-java-format" },
	cs = { "csharpier" },
	xml = { "csharpier" },
	python = { "ruff_fix", "ruff_format", "ruff_organize_imports" },
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
