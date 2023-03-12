return {
	name = "tailwindcss",
	config = {
		filetypes = { "javascriptreact", "typescriptreact", "astro" },
		autostart = true,
		settings = {
			tailwindCSS = {
				classAttributes = { "class", "className", "classList", "ngClass", "class:list" },
			},
		},
	},
}
