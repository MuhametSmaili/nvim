------------------------------
-- Theme
------------------------------
local M = {
	{
		dir = "~/.local/share/nvim/projects/dracula_pro",
		dev = true,
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd([[let g:dracula_colorterm = 0]])
			vim.cmd([[colorscheme dracula_pro]])
		end,
	},
	{
		-- "dracula/vim",
		"Mofiqul/dracula.nvim",
		event = "VeryLazy",
		opts = {
			transparent_bg = true,
			overrides = {
				-- TSTagAttribute = { fg = dracula.colors().green },
			},
		},
		config = function(plugin, opts)
			require("dracula").setup(opts)
		end,
		-- 	-- config = function()
		-- 	-- vim.cmd([[colorscheme dracula]])
		--
		-- 	-- require("dracula").setup({
		-- 	-- 	transparent_bg = true,
		-- 	-- 	italic_comment = true,
		-- 	-- })
		-- 	-- vim.cmd([[let g:dracula_colorterm = 0]])
		-- 	-- vim.cmd([[colorscheme dracula]])
		-- 	-- -- Colors for the cmp
		-- 	-- vim.cmd([[
		-- 	--        " gray
		-- 	--        highlight! CmpItemAbbrDeprecated guibg=NONE gui=strikethrough guifg=#808080
		-- 	--           highlight! CmpItemAbbrMatch guibg=NONE guifg=#569CD6
		-- 	--        " blue
		-- 	--        highlight! link CmpItemAbbrMatchFuzzy CmpItemAbbrMatch
		-- 	--        " light blue
		-- 	--        highlight! CmpItemKindVariable guibg=NONE guifg=#9CDCFE
		-- 	--        highlight! link CmpItemKindInterface CmpItemKindVariable
		-- 	--        highlight! link CmpItemKindText CmpItemKindVariable
		-- 	--        " pink
		-- 	--        highlight! CmpItemKindFunction guibg=NONE guifg=#C586C0
		-- 	--        highlight! link CmpItemKindMethod CmpItemKindFunction
		-- 	--           " CMPValue
		-- 	--        highlight! CmpItemKindValue guibg=NONE guifg=#7970A9
		-- 	--        " front
		-- 	--        highlight! CmpItemKindKeyword guibg=NONE guifg=#D4D4D4
		-- 	--        highlight! link CmpItemKindProperty CmpItemKindKeyword
		-- 	--        highlight! link CmpItemKindUnit CmpItemKindKeyword
		-- 	--
		-- 	--        highlight! CmpItemKindModule guibg=NONE guifg=#f1fa8c
		-- 	--        highlight! CmpItemKindConstant guibg=NONE guifg=#ff79c6
		-- 	--        highlight! CmpItemKindColor guibg=NONE guifg=#f8f8f2
		-- 	--    ]])
		-- 	-- end,
	},
	{
		"olimorris/onedarkpro.nvim",
		event = "VeryLazy",
		opts = {
			options = {
				transparency = true,
			},
		},
	},
}

return M
