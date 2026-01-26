local ensure_installed = {
	-- Linters
	"codespell",
	"cpplint",
	"eslint_d",
	"golangci-lint",
	"ruff",

	-- Formatters
	"black",
	"csharpier",
	"gofumpt",
	"golines",
	"google-java-format",
	"prettierd",
	"stylua",
}

return { "WhoIsSethDaniel/mason-tool-installer.nvim", opts = { ensure_installed = ensure_installed } }
