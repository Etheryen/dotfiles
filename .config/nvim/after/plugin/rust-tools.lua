require("rust-tools").setup({
	server = {
		on_attach = LSP_EXPORT.on_attach,
		capabilities = LSP_EXPORT.capabilities,
	},
})
