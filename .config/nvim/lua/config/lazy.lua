-- Options
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.opt.tabstop = 4
vim.opt.relativenumber = true
-- vim.opt.winborder = "rounded"
vim.opt.shiftwidth = 4
vim.opt.colorcolumn = "80"
vim.opt.hlsearch = false
vim.opt.number = true
vim.opt.mouse = "a"
vim.opt.clipboard = "unnamedplus"
vim.opt.breakindent = true
vim.opt.undofile = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.wo.signcolumn = "yes"
vim.opt.updatetime = 250
vim.opt.timeoutlen = 500
vim.opt.completeopt = "menuone,noselect"
vim.opt.termguicolors = true

-- Keymaps
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

vim.keymap.set("n", "[d", function()
	vim.diagnostic.jump({ count = 1, float = true })
end)
vim.keymap.set("n", "]d", function()
	vim.diagnostic.jump({ count = -1, float = true })
end)

vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float)

vim.keymap.set("n", "<leader>lu", "<cmd>Lazy update<CR>")

-- Autocmd
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("my.lsp", {}),
	callback = function(args)
		vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { buffer = args.buf })
	end,
})

vim.api.nvim_create_autocmd("TextYankPost", {
	group = vim.api.nvim_create_augroup("highlight-on-yank", { clear = true }),
	callback = function()
		vim.hl.on_yank({ higroup = "Visual", timeout = 125, on_visual = false })
	end,
})

-- Lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	spec = { { import = "plugins" } },
	install = { colorscheme = { "catppuccin", "habamax" } },
	checker = { enabled = true, notify = false },
	change_detection = { notify = false },
})
