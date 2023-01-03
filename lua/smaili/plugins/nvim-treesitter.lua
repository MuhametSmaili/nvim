-------------------------------------------------
-- name : nvim-treesitter
-- url  : https://github.com/nvim-treesitter/nvim-treesitter
-------------------------------------------------
local M = {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	event = "BufReadPost",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter-textobjects",
		"JoosepAlviste/nvim-ts-context-commentstring",
		"p00f/nvim-ts-rainbow",
		"windwp/nvim-ts-autotag",
	},
}

function M.config()
	require("nvim-treesitter.configs").setup({
		ensure_installed = {
			"help",
			"javascript",
			"typescript",
			"tsx",
			"lua",
			"json",
			"prisma",
			"sql",
			"gitcommit",
			"html",
			"css",
			"jsdoc",
			"astro",
			"bash",
			"markdown",
			"markdown_inline",
		},
		context_commentstring = { -- for comment -> nvim-ts-context-commentstring
			enable = true,
		},
		autotag = { enable = true }, -- nvim-ts-autotag
		highlight = {
			enable = true,
			additional_vim_regex_highlighting = false,
		},
		rainbow = { -- for nvim-ts-rainbow
			enable = true,
			-- disable = { "tsx", "jsx" },
			extended_mode = true,
			max_file_lines = 1000, -- Do not enable for files with more than n lines, int
			-- colors = {}, -- table of hex strings
			-- termcolors = {} -- table of colour name strings
		},
		indent = {
			enable = true,
		},
		incremental_selection = {
			enable = true,
			keymaps = {
				init_selection = "<c-space>",
				node_incremental = "<c-space>",
				scope_incremental = "<c-s>",
				node_decremental = "<c-backspace>",
			},
		},
		textobjects = {
			select = {
				enable = true,
				lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
				keymaps = {
					-- You can use the capture groups defined in textobjects.scm
					["aa"] = "@parameter.outer",
					["ia"] = "@parameter.inner",
					["af"] = "@function.outer",
					["if"] = "@function.inner",
					["ac"] = "@class.outer",
					["ic"] = "@class.inner",
				},
			},
			move = {
				enable = true,
				set_jumps = true, -- whether to set jumps in the jumplist
				goto_next_start = {
					["]m"] = "@function.outer",
					["]]"] = "@class.outer",
				},
				goto_next_end = {
					["]M"] = "@function.outer",
					["]["] = "@class.outer",
				},
				goto_previous_start = {
					["[m"] = "@function.outer",
					["[["] = "@class.outer",
				},
				goto_previous_end = {
					["[M"] = "@function.outer",
					["[]"] = "@class.outer",
				},
			},
			swap = {
				enable = true,
				swap_next = {
					["<leader>a"] = "@parameter.inner",
				},
				swap_previous = {
					["<leader>A"] = "@parameter.inner",
				},
			},
		},
	})

	local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
	parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }
end

return M
