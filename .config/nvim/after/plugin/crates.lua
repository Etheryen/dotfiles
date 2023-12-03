local crates = require("crates")

crates.setup()

vim.keymap.set("n", "<leader>rcu", function()
	crates.upgrade_all_crates()
end, { desc = "Update crates" })
