local capabilities = require("cmp_nvim_lsp").default_capabilities()

vim.lsp.config("*", {
	capabilities = capabilities,
})

vim.lsp.config("rust_analyzer", {
	settings = {
		["rust-analyzer"] = {
			diagnostics = { enable = false },
		},
	},
})

vim.lsp.config("lua_ls", {
	on_init = function(client)
		if client.workspace_folders then
			local path = client.workspace_folders[1].name
			if vim.loop.fs_stat(path .. "/.luarc.json") or vim.loop.fs_stat(path .. "/.luarc.jsonc") then
				return
			end
		end
		client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua or {}, {
			runtime = { version = "LuaJIT" },
			workspace = {
				checkThirdParty = false,
				library = {
					vim.env.VIMRUNTIME,
					-- add more paths if you need them
				},
			},
		})
	end,
	settings = { Lua = {} },
})

local servers = {
	"golangci_lint_ls",
	"gopls",
	"pyright",
	"ts_ls",
	"svelte",
	"eslint",
	"zls",
	"jsonls",
	"cssls",
	"lua_ls",
	"rust_analyzer",
	"terraformls",
	"tailwindcss",
}

for _, name in ipairs(servers) do
	vim.lsp.enable(name)
end
