-------------------------------------------------
-- name : nvim-lualine
-- url  : https://github.com/nvim-lualine/lualine.nvim
-------------------------------------------------
return {
	"nvim-lualine/lualine.nvim",
	event = "VeryLazy",
	opts = function()
		local my_filename = require("lualine.components.filename"):extend()
		my_filename.apply_icon = require("lualine.components.filetype").apply_icon
		my_filename.colored = true

		local filename_with_path =
			{ my_filename, path = 1, symbols = { modified = " ", readonly = "", unnamed = " " } }

		return {
			options = {
				theme = "auto",
				icons_enabled = true,
				component_separators = "",
				section_separators = "",
			},
			sections = {
				lualine_b = {
					"grapple",
				},
				lualine_c = { filename_with_path },
				lualine_x = {
					"filetype",
					{
						"lsp_status",
						symbols = {
							spinner = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" },
							done = "✓",
							separator = " ",
						},
					},
					"diagnostics",
				},
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
			extensions = { "nvim-tree", "fzf", "lazy", "fugitive", require("custom.utils.snacks_lualine") },
		}
	end,
}
