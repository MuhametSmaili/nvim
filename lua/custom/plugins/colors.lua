-- Theme
------------------------------
------------------------------
return {
	{
		"sainnhe/everforest",
		lazy = false,
		opts = {},
		config = function()
			if Custom.colorscheme.transparent then
				vim.cmd("let g:everforest_transparent_background = 1")
			end
		end,
	},
	{
		"loctvl842/monokai-pro.nvim",
		lazy = false,
		opts = {
			transparent_background = Custom.colorscheme.transparent,
		},
	},
	{
		"oxfist/night-owl.nvim",
		lazy = false,
		opts = {
			transparent_background = Custom.colorscheme.transparent,
		},
	},
	{
		"webhooked/kanso.nvim",
		lazy = false,
		opts = {
			transparent = Custom.colorscheme.transparent,
		},
	},
	{
		"sho-87/kanagawa-paper.nvim",
		lazy = false,
		opts = {
			transparent = Custom.colorscheme.transparent,
		},
	},
	{
		"datsfilipe/vesper.nvim",
		opts = {
			transparent = Custom.colorscheme.transparent,
		},
		lazy = false,
	},
	{
		"olivercederborg/poimandres.nvim",
		lazy = false,
		opts = {
			disable_background = Custom.colorscheme.transparent,
		},
	},
	{
		"sainnhe/gruvbox-material",
		opts = {},
		config = function()
			vim.cmd("let g:gruvbox_material_background = 'hard'")

			if Custom.colorscheme.transparent then
				vim.cmd("let g:gruvbox_material_transparent_background = 1")
			end
		end,
	},
	{
		"rose-pine/neovim",
		name = "rose-pine",
		lazy = false,
		opts = {
			styles = {
				transparency = Custom.colorscheme.transparent,
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
		config = function()
			if Custom.colorscheme.transparent then
				vim.cmd("let g:sonokai_transparent_background = 1")
			end
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
				blink_cmp = true,
				snacks = {
					enabled = true,
					indent_scope_color = "lavender",
				},
				neotest = true,
				mason = true,
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
				mini = { enabled = true },
			},
			transparent_background = Custom.colorscheme.transparent,
			styles = {
				-- keywords = { "italic" },
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
	-- Lazy
	{
		"vague2k/vague.nvim",
		lazy = false,
		opts = {
			transparent = Custom.colorscheme.transparent,
		},
	},
}
