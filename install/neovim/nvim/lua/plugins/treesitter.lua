local parsers = {
	"go",
	"gomod",
	"gosum",
	"gowork",
	"c",
	"lua",
	"vim",
	"vimdoc",
	"query",
	"svelte",
	"typescript",
	"tsx",
	"json",
	"graphql",
	"markdown",
	"markdown_inline",
	"dockerfile",
}

require("nvim-treesitter").install(parsers)

local filetypes = {
	"go",
	"gomod",
	"gosum",
	"gowork",
	"c",
	"lua",
	"vim",
	"query",
	"svelte",
	"typescript",
	"typescriptreact",
	"json",
	"graphql",
	"markdown",
	"dockerfile",
}

vim.api.nvim_create_autocmd("FileType", {
	pattern = filetypes,
	callback = function()
		vim.treesitter.start()
	end,
})
