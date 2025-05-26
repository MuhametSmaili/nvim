-------------------------------------------------
-- name : nvim-lualine
-- url  : https://github.com/nvim-lualine/lualine.nvim
-------------------------------------------------
local function arrow_all_buffers()
	local arrow = require("arrow.statusline")
	local filenames = vim.g.arrow_filenames or {}
	local current_index = arrow.is_on_arrow_file()

	if #filenames == 0 then
		return ""
	end

	local parts = {}
	table.insert(parts, "󱡁 ")

	for i, _ in ipairs(filenames) do
		local label = arrow.text_for_statusline(_, i)
		local highlighted_label

		if i == current_index then
			highlighted_label = "%#ArrowCurrentFile#[" .. label .. "]"
		else
			highlighted_label = "%#ArrowFileIndex#" .. label
		end

		table.insert(parts, highlighted_label)

		if i < #filenames then
			table.insert(parts, "%*|")
		end
	end

	table.insert(parts, "%*")

	return table.concat(parts)
end

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
				lualine_a = {
					{
						"mode",
						fmt = function(str)
							local m = vim.api.nvim_get_mode().mode
							if m == "\22" then
								return "C-V"
							end
							return str:sub(1, 1)
						end,
					},
				},
				lualine_b = {
					{ arrow_all_buffers },
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
