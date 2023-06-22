local null_ls = require("null-ls")
-- local mason_nullls = require("mason-null-ls")

null_ls.setup({
	sources = {
		null_ls.builtins.code_actions.eslint_d,
		null_ls.builtins.diagnostics.eslint_d,
		null_ls.builtins.formatting.eslint_d, -- added because it will run eslintfix
		null_ls.builtins.formatting.stylua, -- added because it will run eslintfix
		null_ls.builtins.diagnostics.ansiblelint,
		null_ls.builtins.formatting.prettierd.with({
			filetypes = {
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
			},
		}),
		null_ls.builtins.formatting.stylua,
	},
})

-- mason_nullls.setup({
-- 	ensure_installed = {
-- 		"prettierd",
-- 		-- "eslint_d",
-- 		"stylua",
-- 		"ansible-lint",
-- 	},
-- 	automatic_installation = true,
-- 	automatic_setup = true,
-- 	handlers = {
-- 		prettierd = function(source_name, methods)
-- 			-- Adding astro for prettier
-- 			null_ls.builtins.formatting.prettierd.filetypes = {
-- 				"javascript",
-- 				"javascriptreact",
-- 				"typescript",
-- 				"typescriptreact",
-- 				"vue",
-- 				"css",
-- 				"scss",
-- 				"less",
-- 				"html",
-- 				"json",
-- 				"jsonc",
-- 				"yaml",
-- 				"markdown",
-- 				"markdown.mdx",
-- 				"graphql",
-- 				"handlebars",
-- 				"astro",
-- 			}
-- 			null_ls.register(null_ls.builtins.formatting.prettierd)
-- 		end,
-- 	},
-- })

-- here we can setup null ls with options that are not supported by mason-null-ls
-- mason_nullls.setup_handlers({})
