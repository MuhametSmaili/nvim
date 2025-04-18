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

	local filename_with_path = { my_filename, path = 1, symbols = { modified = " ", readonly = "", unnamed = " " } }

	require("lualine").setup({
		options = {
			theme = "catppuccin",
			icons_enabled = true,
			-- globalstatus = true, -- to have just one lualine, the inactive_* won't work
			component_separators = "|",
			section_separators = "",
		},
		sections = {
			lualine_c = { filename_with_path },
			lualine_b = { "grapple" },
		},
		inactive_winbar = {
			lualine_a = { "filename" },
			lualine_c = { filename_with_path },
			lualine_y = {
				{
					"datetime",
					style = "default", -- options: default, us, uk, iso, or your own format string ("%H:%M", etc..)
				},
			},
		},
		extensions = { "nvim-tree" },
	})
end

return M
