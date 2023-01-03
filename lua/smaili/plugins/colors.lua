------------------------------
-- Dracula theme
------------------------------
local M = {
	-- "dracula/vim",
  "Mofiqul/dracula.nvim",
	name = "dracula",
	lazy = false,
	priority = 1000,
}

function M.config()
	vim.cmd([[let g:dracula_colorterm = 0]])
	vim.cmd([[colorscheme dracula_pro]])
end

return M
