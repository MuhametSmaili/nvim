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
	event = "VeryLazy",
}

function M.config()
	require("nvim-tree").setup({
		view = {
			adaptive_size = true,
			side = "right",
			hide_root_folder = true,
			number = true,
			relativenumber = true,
		},
		renderer = {
			highlight_opened_files = "all",
			highlight_modified = "all",
		},
		update_focused_file = {
			enable = true,
			debounce_delay = 15,
			update_root = false,
			ignore_list = {},
		},
		actions = {
			open_file = {
				quit_on_open = true,
			},
		},
		-- filters = {
		--  dotfiles = true,
		---},
	})
	local api = require("nvim-tree.api")
	api.events.subscribe(api.events.Event.FileCreated, function(file)
		vim.cmd("edit " .. file.fname)
	end)
end

return M
