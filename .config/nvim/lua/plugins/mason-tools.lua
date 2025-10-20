return {
	"WhoIsSethDaniel/mason-tool-installer.nvim",
	opts = {
		ensure_installed = {
			-- Linters
			"cpplint",
			"codespell",
			"eslint_d",
			"golangci-lint",

			-- Formatters
			"csharpier",
			"gofumpt",
			"golines",
			"google-java-format",
			"prettierd",
			"stylua",
		},
	},
}
