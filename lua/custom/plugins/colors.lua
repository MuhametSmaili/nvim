-- Theme
------------------------------
------------------------------
return {
	{
		"sainnhe/everforest",
		opts = {},
		config = function()
			vim.cmd("let g:everforest_transparent_background = 1")
		end,
	},
	{
		"sainnhe/gruvbox-material",
		config = function()
			vim.cmd("let g:gruvbox_material_background = 'hard'")
			-- vim.cmd("let g:gruvbox_material_transparent_background = 1")
		end,
	},
	{
		"rose-pine/neovim",
		name = "rose-pine",
		opts = {
			styles = {
				transparency = true,
			},
			before_highlight = function(group, highlight, palette)
				-- Disable all undercurls
				if highlight.undercurl then
					highlight.undercurl = false
				end
				--
				-- Change palette colour
				-- if highlight.fg == palette.pine then
				--     highlight.fg = palette.foam
				-- end
			end,
		},
	},
	{
		"sainnhe/sonokai",
		config = function()
			vim.cmd("let g:sonokai_transparent_background = 1")
		end,
		opts = {},
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		opts = {
			transparent_background = true,
			styles = {
				keywords = { "italic" },
			},
			highlight_overrides = {
				all = function(_)
					return {
						LineNr = { fg = "#4b5481" },
					}
				end,
			},
		},
	},
}
