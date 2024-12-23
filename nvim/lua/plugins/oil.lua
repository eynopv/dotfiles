require("oil").setup({
	view_options = {
		show_hidden = true,
		is_always_hidden = function(name, buffer)
			return name == ".." or name == ".git"
		end,
	},
})
