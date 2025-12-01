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

local config_tweaks = {
	gopls = {
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
	},
	ts_ls = { settings = { implicitProjectConfiguration = { allowJs = true, checkJs = true } } },
	pyright = {
		settings = {
			python = {
				pythonPath = (function()
					local venv_path = vim.fn.getcwd() .. "/.venv/bin/python"
					if vim.fn.executable(venv_path) == 1 then
						return venv_path
					end
					return vim.fn.exepath("python") or vim.fn.exepath("python3") or "python"
				end)(),
			},
		},
	},
}

return {
	"neovim/nvim-lspconfig",
	dependencies = {
		{ "williamboman/mason.nvim", opts = {} },
		{ "williamboman/mason-lspconfig.nvim", opts = { ensure_installed = servers } },
		{
			"folke/lazydev.nvim",
			ft = "lua",
			opts = { library = { { path = "${3rd}/luv/library", words = { "vim%.uv" } } } },
		},
	},
	config = function()
		for server, config in pairs(config_tweaks) do
			vim.lsp.config[server] = config
		end

		vim.keymap.set("n", "<leader>ih", function()
			vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
		end)
	end,
}
