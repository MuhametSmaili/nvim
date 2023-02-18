------------------------------
-- Theme
------------------------------
local M = {
	{
		dir = "~/.local/share/nvim/projects/dracula",
		dev = true,
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd([[let g:dracula_colorterm = 0]])
			vim.cmd([[colorscheme dracula_pro]])
		end,
	},
}

return M
