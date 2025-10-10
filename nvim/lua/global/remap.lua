vim.g.mapleader = " "

vim.keymap.set("n", "<leader>d", "<CMD>Oil<CR>")
vim.keymap.set("n", "<leader>j", "<CMD>Oil<CR>")

vim.keymap.set("n", "<C-p>", ":GFiles<CR>")
vim.keymap.set("n", "<C-f>", ":Files<CR>")
vim.keymap.set("n", "<C-b>", ":Buffers<CR>")
vim.keymap.set("n", "<C-j>", ":cnext<CR>")
vim.keymap.set("n", "<C-k>", ":cprev<CR>")

-- yank into system clipboard
vim.keymap.set("v", "<C-y>", '"+y')
vim.keymap.set("n", "<C-y>", '"+y')

-- Open diagnostic with nvim-lsp
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set("n", "<space>e", vim.diagnostic.open_float)
--vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
--vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
--vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(ev)
		-- Enable completion triggered by <c-x><c-o>
		vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

		-- Buffer local mappings.
		-- See `:help vim.lsp.*` for documentation on any of the below functions
		local opts = { buffer = ev.buf }
		vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)

		-- Never used workspaces
		--vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
		--vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
		--vim.keymap.set("n", "<space>wl", function()
		--	print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
		--end, opts)

		vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
		--  default mapping is "C-s"
		-- vim.keymap.set("i", "<C-k>", vim.lsp.buf.signature_help, opts)

		-- can just use "gd"
		-- vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts)

		-- default mapping is "gri"
		-- vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)

		-- default mapping is "grn"
		-- vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)

		-- default mapping is "gra"
		-- vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, opts)

		-- default mapping is "grr"
		-- vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)

		-- I use format on save
		--vim.keymap.set("n", "<space>f", function()
		--  vim.lsp.buf.format({ async = true })
		--end, opts)
	end,
})
