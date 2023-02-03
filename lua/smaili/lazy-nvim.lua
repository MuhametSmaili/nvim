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
require("lazy").setup("smaili.plugins", {
	defaults = { lazy = true },
	install = { colorscheme = { "dracula", "tokyonight" } },
	checker = { enabled = true },
	performance = {
		rtp = {
			disabled_plugins = {
				"gzip",
				-- "matchit",
				-- "matchparen",
				"netrwPlugin",
				"tarPlugin",
				"tohtml",
				"tutor",
				-- "zipPlugin",
			},
		},
	},
	debug = false,
})
