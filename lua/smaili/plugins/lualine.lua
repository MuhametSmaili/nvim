-------------------------------------------------
-- name : nvim-lualine
-- url  : https://github.com/nvim-lualine/lualine.nvim
-------------------------------------------------
local M = {
	"nvim-lualine/lualine.nvim",
	event = "VeryLazy",
}

function M.config()
	local my_filename = require("lualine.components.filename"):extend()
	my_filename.apply_icon = require("lualine.components.filetype").apply_icon
	my_filename.colored = true

	require("lualine").setup({
		options = {
			icons_enabled = true,
			globalstatus = true,
			component_separators = "|",
			section_separators = "",
		},
		sections = {
			lualine_c = {
				{ my_filename, path = 1, symbols = { modified = " ", readonly = "", unnamed = " " } },
			},
		},
		extensions = { "nvim-tree" },
	})
end

return M
