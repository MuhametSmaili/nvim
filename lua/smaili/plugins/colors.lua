------------------------------
-- Theme
------------------------------
local M = {
	{
		"folke/tokyonight.nvim",
		event = "VeryLazy",
		opts = {
			transparent = true,
		},
	},
	{
		"dracula/vim",
		name = "dracula",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd([[ 
        let g:dracula_colorterm = 0
        colorscheme dracula
      ]])
		end,
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
