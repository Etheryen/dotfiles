local linters_by_ft = {
	cpp = { "cpplint" },
	typescript = { "eslint_d" },
	javascript = { "eslint_d" },
	typescriptreact = { "eslint_d" },
	javascriptreact = { "eslint_d" },
	go = { "golangcilint" },
	["*"] = { "codespell" },
}

local custom_args = {
	cpplint = {
		"--filter=-legal/copyright,-whitespace/comments,-whitespace/indent_namespace,-build/include_subdir,-build/namespaces,-build/c++17,-readability/alt_tokens,-whitespace/indent,-whitespace/braces",
		function()
			return vim.api.nvim_buf_get_name(0)
		end,
	},
}

return {
	"mfussenegger/nvim-lint",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local lint = require("lint")

		lint.linters_by_ft = linters_by_ft

		for linter, args in pairs(custom_args) do
			lint.linters[linter].args = args
		end

		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
			group = vim.api.nvim_create_augroup("lint", { clear = true }),
			callback = function()
				lint.try_lint()
			end,
		})
	end,
}
