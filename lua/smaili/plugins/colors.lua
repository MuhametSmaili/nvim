------------------------------
-- Theme
------------------------------
local M = {
	{
		"maxmx03/dracula.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			local dracula = require("dracula")
			local colors = require("dracula.palettes")
			local setup_options = require("user.colors")

			dracula.setup(setup_options.dracula(colors))
			vim.cmd("colorscheme dracula")
		end,
	},
	{
		"folke/tokyonight.nvim",
		event = "VeryLazy",
		opts = {
			transparent = true,
		},
	},
	{
		"rebelot/kanagawa.nvim",
		event = "VeryLazy",
		opts = { transparent = true },
	},
	{
		"catppuccin/nvim",
		event = "VeryLazy",
		name = "catppuccin",
		opts = {
			transparent_background = true,
		},
	},
}

return M
