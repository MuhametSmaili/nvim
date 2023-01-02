local M = {
	name = "sumneko_lua",
}

M.config = {

	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
		},
	},
}

return M
