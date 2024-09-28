-- Theme
------------------------------
------------------------------
return {
	{
		"sainnhe/everforest",
		keys = { { "<leader>sc", ":FzfLua colorschemes<cr>", desc = "Search colorschemes" } },
		opts = {},
		config = function()
			vim.cmd("let g:everforest_transparent_background = 1")
		end,
	},
	{
		"sainnhe/gruvbox-material",
		config = function()
			vim.cmd("let g:gruvbox_material_background = 'hard'")
			vim.cmd("let g:gruvbox_material_transparent_background = 1")
		end,
	},
	{
		"rose-pine/neovim",
		name = "rose-pine",
		keys = { { "<leader>sc", ":FzfLua colorschemes<cr>", desc = "Search colorschemes" } },
		opts = {
			styles = {
				transparency = true,
			},
			before_highlight = function(_, highlight)
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
		keys = { { "<leader>sc", ":FzfLua colorschemes<cr>", desc = "Search colorschemes" } },
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
				treesitter = true,
				treesitter_context = true,
				notify = false,
				fzf = true,
				gitsigns = true,
				nvimtree = true,
				illuminate = {
					enabled = true,
					lsp = false,
				},
				native_lsp = {
					enabled = true,
					virtual_text = {
						errors = { "italic" },
						hints = { "italic" },
						warnings = { "italic" },
						information = { "italic" },
						ok = { "italic" },
					},
					underlines = {
						errors = { "undercurl" },
						hints = { "undercurl" },
						warnings = { "undercurl" },
						information = { "undercurl" },
					},
					inlay_hints = {
						background = true,
					},
				},
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
