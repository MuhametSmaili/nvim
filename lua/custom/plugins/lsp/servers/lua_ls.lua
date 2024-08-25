return {
	name = "lua-language-server",
	settings = {
		Lua = {
			workspace = {
				checkThirdParty = false,
			},
			completion = {
				callSnippet = "Replace",
			},
			diagnostics = {
				globals = { "vim" },
			},
			hint = { enable = true },
		},
	},
}
