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

		xml = {
			require("formatter.filetypes.xml").xmllint,
		},

		sql = {
			require("formatter.filetypes.sql").sql_formatter,
		},

		markdown = {
			function()
				return {
					exe = "prettier",
					args = {
						"--stdin-filepath",
						util.escape_path(util.get_current_buffer_file_path()),
						"--config-precedence",
						"prefer-file",
						"--prose-wrap",
						"always",
						"--print-width",
						"100",
					},
					stdin = true,
					try_node_modules = true,
				}
			end,
		},

		python = {
			function()
				-- Use ruff if available in project
				if vim.fn.executable("ruff") == 1 then
					return require("formatter.filetypes.python").ruff()
				end

				-- Fallback to black as my default
				return require("formatter.filetypes.python").black()
			end,
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

		graphql = {
			require("formatter.filetypes.graphql").prettier,
		},

		terraform = {
			require("formatter.filetypes.terraform").terraformfmt,
		},

		--["*"] = {
		--	require("formatter.filetypes.any").remove_trailing_whitespace,
		--},
	},
})

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
augroup("__formatter__", { clear = true })
autocmd("BufWritePost", {
	group = "__formatter__",
	callback = function()
		if vim.bo.filetype ~= "oil" then
			vim.cmd("FormatWrite")
		end
	end,
})
