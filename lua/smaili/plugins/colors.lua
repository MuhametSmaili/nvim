-- Theme
------------------------------
------------------------------
local M = {
	{ "sainnhe/everforest" },
	{
		"sainnhe/gruvbox-material",
		config = function()
			vim.cmd("let g:gruvbox_material_background = 'hard'")
		end,
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
				nvimtree = true,
				mason = true,
				aerial = true,
				telescope = false,
				-- ts_rainbow2 = true,
				notify = true,
				noice = true,
			},
		},
		config = function(plugin)
			require("catppuccin").setup(plugin.opts)
			vim.cmd("colorscheme catppuccin")
		end,
	},
}

return M
