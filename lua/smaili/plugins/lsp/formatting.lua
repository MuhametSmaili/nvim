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

mason_nullls.setup_handlers({
	prettierd = function(source_name, methods)
		-- Adding astro for prettier
		null_ls.builtins.formatting.prettierd.filetypes = {
			"javascript",
			"javascriptreact",
			"typescript",
			"typescriptreact",
			"vue",
			"css",
			"scss",
			"less",
			"html",
			"json",
			"jsonc",
			"yaml",
			"markdown",
			"markdown.mdx",
			"graphql",
			"handlebars",
			"astro",
		}
	end,
})

null_ls.setup({})
-- here we can setup null ls with options that are not supported by mason-null-ls
mason_nullls.setup_handlers({})
