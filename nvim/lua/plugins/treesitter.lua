local langs = {
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

require("nvim-treesitter").install(langs)

vim.api.nvim_create_autocmd("FileType", {
	pattern = langs,
	callback = function()
		vim.treesitter.start()
	end,
})
