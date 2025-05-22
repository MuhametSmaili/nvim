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

		local function arrow()
			local status = require("arrow.statusline").text_for_statusline_with_icons()
			return status
		end

		local arrow_module = {
			arrow,
		}
		local statusline = require("arrow.statusline")
		arrow_index = statusline.text_for_statusline(_, i)
		print(index)
		-- local arrow_filenames = vim.g.arrow_filenames

		return {
			options = {
				theme = "auto",
				icons_enabled = true,
				component_separators = "",
				section_separators = "",
			},
			sections = {
				lualine_b = {
					arrow_module,
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
			extensions = { "nvim-tree", "fzf", "lazy", "fugitive" },
		}
	end,
}
