-- Theme
------------------------------
------------------------------
local M = {
	{
		"maxmx03/dracula.nvim",
		config = function()
			-- Getting custom colors
			local dracula = require("dracula")
			local colors = require("dracula.palettes")
			local setup_options = require("user.colors")
			dracula.setup(setup_options.dracula(colors))
			-- vim.cmd("colorscheme dracula")
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
		lazy = false,
		priority = 1000,
		"catppuccin/nvim",
		name = "catppuccin",
		opts = {
			transparent_background = true,
			highlight_overrides = {
				all = function(colors)
					return {
						LineNr = { fg = "#4b5481" },
						-- IllumniatedWordRead = { link = "LspReferenceRead " }, -- alternative to this color #426646
						-- IllumniatedWordText = { link = "LspReferenceText " },
						-- IllumniatedWordWrite = { link = "LspReferenceWrite " },
					}
				end,
			},
		},
		config = function(plugin)
			require("catppuccin").setup(plugin.opts)
			vim.cmd("colorscheme catppuccin")
		end,
	},
}

return M
