local util = require("formatter.util")

require("formatter").setup({
	logging = true,
	log_level = vim.log.levels.DEBUG,

	filetype = {
		go = {
			require("formatter.filetypes.go").gofmt,
		},

		javascriptreact = {
			require("formatter.filetypes.javascriptreact").prettier,
		},

		typescriptreact = {
			require("formatter.filetypes.typescriptreact").prettier,
		},

		typescript = {
			require("formatter.filetypes.typescript").prettier,
		},

		javascript = {
			require("formatter.filetypes.javascript").prettier,
		},

		svelte = {
			require("formatter.filetypes.svelte").prettier,
		},

		jsonc = {
			require("formatter.filetypes.json").prettier,
		},

		json = {
			require("formatter.filetypes.json").prettier,
		},

		markdown = {
			require("formatter.filetypes.markdown").prettier,
		},

		python = {
			require("formatter.filetypes.python").black,
		},

		lua = {
			require("formatter.filetypes.lua").stylua,
		},

		css = {
			require("formatter.filetypes.css").prettier,
		},

		html = {
			require("formatter.filetypes.html").prettier,
		},

		yaml = {
			require("formatter.filetypes.yaml").prettier,
		},

		terraform = {
			require("formatter.filetypes.terraform").terraformfmt,
		},

		["*"] = {
			require("formatter.filetypes.any").remove_trailing_whitespace,
		},
	},
})

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
augroup("__formatter__", { clear = true })
autocmd("BufWritePost", {
	group = "__formatter__",
	command = ":FormatWrite",
})
