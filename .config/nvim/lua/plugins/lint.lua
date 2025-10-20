return {
	"mfussenegger/nvim-lint",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
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
			local config_exists = (function()
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
			end)()

			local args = {
				"--format",
				"json",
				"--stdin",
				"--stdin-filename",
				function()
					return vim.api.nvim_buf_get_name(0)
				end,
			}

			if not config_exists then
				table.insert(args, "--config")
				table.insert(args, "/home/etheryen/.eslint/eslint.config.mjs")
			end

			return args
		end)()

		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
			group = vim.api.nvim_create_augroup("lint", { clear = true }),
			callback = function()
				lint.try_lint()
			end,
		})
	end,
}
