-- Theme
------------------------------
------------------------------
return {
	{
		"sainnhe/everforest",
		lazy = true,
		opts = {},
		config = function()
			vim.cmd("let g:everforest_transparent_background = 1")
		end,
	},
	{
		lazy = true,
		"sainnhe/gruvbox-material",
		config = function()
			vim.cmd("let g:gruvbox_material_background = 'hard'")
			-- vim.cmd("let g:gruvbox_material_transparent_background = 1")
		end,
	},
	{
		"rose-pine/neovim",
		name = "rose-pine",
		lazy = true,
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
		lazy = true,
		config = function()
			vim.cmd("let g:sonokai_transparent_background = 1")
		end,
		opts = {},
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		lazy = false,
		priority = 1000,
		opts = {
			integrations = {
				cmp = true,
				gitsigns = true,
				nvimtree = true,
				treesitter = true,
				notify = false,
				fzf = true,
				gitsigns = true,
				nvimtree = true,
				illuminate = true,
				mini = {
					enabled = true,
					indentscope_color = "",
				},
			},
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
		config = function(_, opts)
			require("catppuccin").setup(opts)
			vim.cmd.colorscheme("catppuccin")
		end,
	},
}
