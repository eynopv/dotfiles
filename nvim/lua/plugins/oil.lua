require("oil").setup({
	view_options = {
		show_hidden = true,
		is_always_hidden = function(name, buffer)
			return name == ".." or name == ".git"
		end,
	},
	float = {
		border = "rounded",
	},
	confirmation = {
		border = "rounded",
	},
	progress = {
		border = "rounded",
	},
	ssh = {
		border = "rounded",
	},
	keymaps_help = {
		border = "rounded",
	},
})
