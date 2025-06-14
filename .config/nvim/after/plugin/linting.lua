local lint = require("lint")

lint.linters_by_ft = {
	cpp = { "cpplint" },
	typescript = { "eslint_d" },
	javascript = { "eslint_d" },
	typescriptreact = { "eslint_d" },
	javascriptreact = { "eslint_d" },
	go = { "golangcilint" },
	["*"] = { "codespell" },
}

lint.linters.cpplint.args = {
	"--filter=-legal/copyright,-whitespace/comments,-whitespace/indent_namespace,-build/include_subdir,-build/namespaces,-build/c++17,-readability/alt_tokens,-whitespace/indent,-whitespace/braces",
	function()
		return vim.api.nvim_buf_get_name(0)
	end,
}

lint.linters.eslint_d.args = (function()
	local function config_exists()
		local names = {
			".eslintrc.json",
			".eslintrc.js",
			".eslintrc.cjs",
			".eslintrc.mjs",
			".eslintrc.yaml",
			".eslintrc.yml",
			".eslintrc",
			"eslint.config.js",
			"eslint.config.mjs",
			"eslint.config.cjs",
			"eslint.config.ts",
			"eslint.config.mts",
			"eslint.config.cts",
		}
		for _, v in ipairs(names) do
			if vim.fn.filereadable(v) == 1 then
				return true
			end
		end
		return false
	end

	if config_exists() then
		return {
			"--format",
			"json",
			"--stdin",
			"--stdin-filename",
			function()
				return vim.api.nvim_buf_get_name(0)
			end,
		}
	end

	return {
		"--config",
		"/home/etheryen/.eslint/eslint.config.mjs",
		"--format",
		"json",
		"--stdin",
		"--stdin-filename",
		function()
			return vim.api.nvim_buf_get_name(0)
		end,
	}
end)()

local lint_autogroup = vim.api.nvim_create_augroup("lint", { clear = true })

vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
	group = lint_autogroup,
	callback = function()
		lint.try_lint()
	end,
})

vim.keymap.set("n", "<leader>ll", function()
	lint.try_lint()
end, { desc = "Trigger linting for current file" })
