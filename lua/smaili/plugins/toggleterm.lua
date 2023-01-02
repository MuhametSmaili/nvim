-------------------------------------------------
-- name : toggleterm-nvim 
-- url  : https://github.com/akinsho/toggleterm.nvim
-------------------------------------------------

local M = {
	"akinsho/toggleterm.nvim",
	event = "VeryLazy",
}

function M.config()
	require("toggleterm").setup({
		open_mapping = [[<c-`>]],
	})
end

return M
