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
		"projekt0n/github-nvim-theme",
		-- opts={
		--   options={
		--     transparent = true
		--   }
		-- }
	},
	{
		"folke/tokyonight.nvim",
		opts = {
			transparent = true,
		},
	},
	{
		"rebelot/kanagawa.nvim",
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
					}
				end,
			},
			integrations = {
				illuminate = true,
				lsp_saga = true,
				treesitter = true,
				which_key = true,
				treesitter_context = true,
				telescope = false,
				-- ts_rainbow2 = true,
			},
		},
		config = function(plugin)
			require("catppuccin").setup(plugin.opts)
			vim.cmd("colorscheme catppuccin")
		end,
	},
}

return M
