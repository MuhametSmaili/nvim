local M = {
	name = "tailwindcss",
}

M.config = {
	filetypes = { "javascriptreact", "typescriptreact", "astro" },
	autostart = true,
	settings = {
		tailwindCSS = {
			classAttributes = { "class", "className", "classList", "ngClass", "class:list" },
		},
	},
}

return M
