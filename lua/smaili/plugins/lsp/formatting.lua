local null_ls = require("null-ls")
local mason_nullls = require("mason-null-ls")
mason_nullls.setup({
	ensure_installed = {
		"prettierd",
		"eslint_d",
		"stylua",
	},
	automatic_installation = true,
	automatic_setup = true,
})

null_ls.setup({})
-- here we can setup null ls with options that are not supported by mason-null-ls
mason_nullls.setup_handlers({})
