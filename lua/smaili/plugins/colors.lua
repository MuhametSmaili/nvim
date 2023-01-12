------------------------------
-- Theme
------------------------------
local M = {
	{
		"dracula/vim",
		name = "dracula",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd([[let g:dracula_colorterm = 0]])
			vim.cmd([[colorscheme dracula]])
			-- Colors for the cmp
			vim.cmd([[
          " gray
          highlight! CmpItemAbbrDeprecated guibg=NONE gui=strikethrough guifg=#808080
          " blue
          highlight! CmpItemAbbrMatch guibg=NONE guifg=#569CD6
          highlight! link CmpItemAbbrMatchFuzzy CmpItemAbbrMatch
          " light blue
          highlight! CmpItemKindVariable guibg=NONE guifg=#9CDCFE
          highlight! link CmpItemKindInterface CmpItemKindVariable
          highlight! link CmpItemKindText CmpItemKindVariable
          " pink
          highlight! CmpItemKindFunction guibg=NONE guifg=#C586C0
          highlight! link CmpItemKindMethod CmpItemKindFunction
          " front
          highlight! CmpItemKindKeyword guibg=NONE guifg=#D4D4D4
          highlight! link CmpItemKindProperty CmpItemKindKeyword
          highlight! link CmpItemKindUnit CmpItemKindKeyword

          highlight! CmpItemKindModule guibg=NONE guifg=#f1fa8c
          highlight! CmpItemKindConstant guibg=NONE guifg=#ff79c6
          highlight! CmpItemKindColor guibg=NONE guifg=#f8f8f2 
      ]])
		end,
	},
	-- { "navarasu/onedark.nvim", event = "VeryLazy" },
	{
		"olimorris/onedarkpro.nvim",
		event = "VeryLazy",
	},
}

function M.config()
	require("onedarkpro").setup({
		colors = {}, -- Override default colors or create your own
		highlights = {}, -- Override default highlight groups or create your own
		styles = { -- For example, to apply bold and italic, use "bold,italic"
			types = "italic", -- Style that is applied to types
			numbers = "NONE", -- Style that is applied to numbers
			strings = "NONE", -- Style that is applied to strings
			comments = "NONE", -- Style that is applied to comments
			keywords = "bold", -- Style that is applied to keywords
			constants = "NONE", -- Style that is applied to constants
			functions = "NONE", -- Style that is applied to functions
			operators = "NONE", -- Style that is applied to operators
			variables = "NONE", -- Style that is applied to variables
			conditionals = "NONE", -- Style that is applied to conditionals
			virtual_text = "NONE", -- Style that is applied to virtual text
		},
		options = {
			bold = true, -- Use bold styles?
			italic = true, -- Use italic styles?
			underline = true, -- Use underline styles?
			undercurl = true, -- Use undercurl styles?

			cursorline = true, -- Use cursorline highlighting?
			transparency = true, -- Use a transparent background?
			terminal_colors = true, -- Use the theme's colors for Neovim's :terminal?
			highlight_inactive_windows = false, -- When the window is out of focus, change the normal background?
		},
	})
end

return M
