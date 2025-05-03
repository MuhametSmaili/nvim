-- Theme
------------------------------
------------------------------
return {
	{
		"sainnhe/everforest",
		lazy = false,
		opts = {},
		config = function()
			vim.cmd("let g:everforest_transparent_background = 1")
		end,
	},
	{
		"loctvl842/monokai-pro.nvim",
		lazy = false,
		config = function()
			require("monokai-pro").setup({
				transparent_background = true,
			})
		end,
	},
	{
		"sho-87/kanagawa-paper.nvim",
		lazy = false,
		opts = {
			transparent = true,
		},
	},
	{
		"datsfilipe/vesper.nvim",
		opts = {},
		lazy = false,
	},
	{
		"olivercederborg/poimandres.nvim",
		lazy = false,
		-- priority = 1000,
		config = function()
			require("poimandres").setup({
				-- leave this setup function empty for default config
				-- or refer to the configuration section
				-- for configuration options
			})
		end,

		-- optionally set the colorscheme within lazy config
		-- init = function()
		-- 	vim.cmd("colorscheme poimandres")
		-- end,
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
		lazy = false,
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
			transparent_background = true,
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
		config = function(_, opts)
			require("catppuccin").setup(opts)
			-- vim.cmd.colorscheme("catppuccin")
		end,
	},
	-- Lazy
	{
		"vague2k/vague.nvim",
		lazy = false,
		config = function()
			require("vague").setup({
				transparent = true,
				-- optional configuration here
			})
			-- vim.cmd.colorscheme("vague")
		end,
	},
}
