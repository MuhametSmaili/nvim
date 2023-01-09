-------------------------------------------------
-- name : Indent Blankline
-- url  : https://github.com/lukas-reineke/indent-blankline.nvim
-------------------------------------------------
local M = {
	"lukas-reineke/indent-blankline.nvim",
	event = "VeryLazy",
}

function M.config()
	require("indent_blankline").setup({
		char = "┊",
		show_trailing_blankline_indent = false,
		show_current_context = true,
		-- show_current_context_start = true,
	})
end

return M
