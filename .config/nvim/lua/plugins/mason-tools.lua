local ensure_installed = {
	-- Linters
	"cpplint",
	"codespell",
	"eslint_d",
	"golangci-lint",

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
