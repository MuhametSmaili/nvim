------------------------------
-- Dracula theme
------------------------------
local M = {
	"navarasu/onedark.nvim",
	dependencies = {
		{ "dracula/vim", name = "dracula" },
	},
	lazy = false,
	priority = 1000,
}

function M.config()
	vim.cmd([[let g:dracula_colorterm = 0]])
	vim.cmd([[colorscheme dracula_pro]])
end

return M
