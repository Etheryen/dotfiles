require("mason-tool-installer").setup({
	ensure_installed = {
		-- Linters
		"cpplint",
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
