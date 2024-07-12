local lspconfig = require("lspconfig")
local configs = require("lspconfig/configs")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

if not configs.golangcilsp then
	configs.golangcilsp = {
		default_config = {
			cmd = { "golangci-lint-langserver" },
			root_dir = lspconfig.util.root_pattern(".git"),
			init_options = {
				command = {
					"golangci-lint",
					"run",
					"--enable-all",
					"--disable",
					"lll",
					"--out-format",
					"json",
					"--issues-exit-code=1",
				},
			},
		},
	}
end
lspconfig.golangci_lint_ls.setup({
	filetypes = { "go", "gomod" },
	capabilities = capabilities,
})

lspconfig.pyright.setup({
	capabilities = capabilities,
})

lspconfig.tsserver.setup({
	capabilities = capabilities,
})

lspconfig.svelte.setup({
	capabilities = capabilities,
})
--lspconfig.eslint.setup({})
lspconfig.gopls.setup({
	capabilities = capabilities,
})

lspconfig.zls.setup({
	capabilities = capabilities,
})

lspconfig.jsonls.setup({
	capabilities = capabilities,
})
