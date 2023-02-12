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
				-- {
				-- 	function()
				-- 		local navic = require("nvim-navic")
				-- 		local ret = navic.get_location()
				-- 		return ret:len() > 2000 and "navic error" or ret
				-- 	end,
				-- 	cond = function()
				-- 		if package.loaded["nvim-navic"] then
				-- 			local navic = require("nvim-navic")
				-- 			navic.setup({
				-- 				icons = require("smaili.plugins.lsp.icons"),
				-- 				separator = " ",
				-- 			})
				-- 			return navic.is_available()
				-- 		end
				-- 	end,
				-- 	color = { fg = "#8be9fd" },
				-- },
			},
		},
		-- inactive_winbar = {
		-- 	-- 	lualine_a = { my_filename },
		-- 	lualine_z = {
		-- 		{
		-- 			my_filename,
		-- 			path = 0,
		-- 			symbols = { modified = " ", readonly = "", unnamed = " " },
		-- 		},
		-- 	},
		-- },
		inactive_sections = {
			-- lualine_c = { my_filename },
			lualine_c = { "filename" },
			lualine_x = { "testinggggg" },
		},
		extensions = { "nvim-tree" },
	})
end

return M
