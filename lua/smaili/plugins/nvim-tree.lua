-------------------------------------------------
-- name : nvim-tree
-- url  : https://github.com/nvim-tree/nvim-tree.lua
-------------------------------------------------
local M = {
	"nvim-tree/nvim-tree.lua",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	lazy = false,
	envent = "BufReadPre",
}

function M.config()
	require("nvim-tree").setup({
		view = {
			adaptive_size = true,
			side = "right",
		},
		renderer = {
			highlight_opened_files = "all",
		},
		update_focused_file = {
			enable = true,
			debounce_delay = 15,
			update_root = false,
			ignore_list = {},
		},
		-- filters = {
		--  dotfiles = true,
		---},
	})
end

return M
