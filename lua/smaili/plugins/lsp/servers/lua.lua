local M = {
	name = "lua_ls",
}

M.config = {

	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim", "smaili" },
			},
		},
	},
}

return M
