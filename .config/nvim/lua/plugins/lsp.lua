local servers = {
	"bashls",
	"clangd",
	"cmake",
	"cssls",
	"emmet_ls",
	"gopls",
	"html",
	"jdtls",
	"lua_ls",
	"omnisharp",
	"powershell_es",
	"prismals",
	"pyright",
	"rust_analyzer",
	"tailwindcss",
	"taplo",
	"ts_ls",
}

return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		{ "folke/lazydev.nvim", ft = "lua", opts = {} },
	},
	config = function()
		require("mason").setup()
		require("mason-lspconfig").setup({ ensure_installed = servers })

		vim.lsp.config.gopls = {
			filetypes = { "go", "gomod", "gowork", "gotmpl" },
			settings = {
				gopls = {
					completeUnimported = true,
					usePlaceholders = true,
					analyses = {
						unusedparams = true,
						shadow = true,
						unusedwrite = true,
						useany = true,
						unusedvariable = true,
					},
					hints = {
						assignVariableTypes = true,
						compositeLiteralFields = true,
						compositeLiteralTypes = true,
						constantValues = true,
						functionTypeParameters = true,
						parameterNames = true,
						rangeVariableTypes = true,
					},
				},
			},
		}

		vim.lsp.config.html = { filetypes = { "html", "twig", "hbs" } }

		vim.lsp.config.lua_ls = {
			settings = {
				Lua = {
					workspace = { checkThirdParty = false },
					telemetry = { enable = false },
				},
			},
		}

		vim.lsp.config.ts_ls =
			{ settings = { implicitProjectConfiguration = {
				allowJs = true,
				checkJs = true,
			} } }
	end,
}
