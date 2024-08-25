require("custom")
-------------------------------------------------
-- ==== PLUGIN MANAGER ====
--=
-- name : lazy-nvim
-- url  : https://github.com/folke/lazy.nvim
-------------------------------------------------
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"--single-branch",
		"git@github.com:folke/lazy.nvim.git",
		lazypath,
	})
end

vim.opt.runtimepath:prepend(lazypath)

-- Load plugins
require("lazy").setup({
	spec = {
		{ import = "custom.plugins" },
		{ import = "custom.plugins.lsp" },
	},
	defaults = { lazy = true },
	install = { colorscheme = { "catppuccin" } },
	checker = { enabled = true },
	ui = { border = "rounded" },
	performance = {
		cache = {
			enabled = true,
		},
		rtp = {
			disabled_plugins = {
				-- "matchit",
				-- "matchparen",
				"netrwPlugin",
				"gzip",
				"tarPlugin",
				"tohtml",
				"tutor",
				"zipPlugin",
			},
		},
	},
	debug = false,
})
