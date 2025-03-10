require("mason-tool-installer").setup({
	ensure_installed = {
		-- Linters
		"codespell",
		"eslint_d",
		"golangci-lint",

		-- Formatters
		"gofumpt",
		"golines",
		"prettierd",
		"stylua",
	},
})
