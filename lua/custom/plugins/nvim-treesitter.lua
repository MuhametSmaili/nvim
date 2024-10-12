-------------------------------------------------
-- name : nvim-treesitter
-- url  : https://github.com/nvim-treesitter/nvim-treesitter
-------------------------------------------------
return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	event = "BufReadPost",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{
			"nvim-treesitter/nvim-treesitter-context",
			config = true,
			opts = { enable = false },
			keys = {
				{ "<leader>uc", ":TSContextToggle<CR>", desc = "Toggle TSContext" },
				{
					"[c",
					":lua require('treesitter-context').go_to_context()<cr>",
					silent = true,
					desc = "Go to context",
				},
			},
		},
		"nvim-treesitter/nvim-treesitter-textobjects",
	},
	opts = {
		ensure_installed = {
			"javascript",
			"typescript",
			"tsx",
			"lua",
			"jsdoc",
			"json",
			"json5",
			"jsonc",
			"prisma",
			"sql",
			"regex",
			"html",
			"css",
			"jsdoc",
			"astro",
			"go",
			"gomod",
			"bash",
			"markdown",
			"http",
			"markdown_inline",
			"query",
			"vim",
			"vimdoc",
			"gitignore",
			"gitcommit",
			"diff",
			"git_rebase",
			"toml",
			"yaml",
		},
		highlight = {
			enable = true,
			disable = { "bash" },
			additional_vim_regex_highlighting = false,
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
		query_linter = {
			enable = true,
			use_virtual_text = true,
			-- lint_events = { "BufWrite", "CursorHold" },
		},
		playground = {
			enable = true,
			disable = {},
			updatetime = 25,
			persist_queries = false,
			keybindings = {
				toggle_query_editor = "o",
				toggle_hl_groups = "i",
				toggle_injected_languages = "t",
				toggle_anonymous_nodes = "a",
				toggle_language_display = "I",
				focus_language = "f",
				unfocus_language = "F",
				update = "R",
				goto_node = "<cr>",
				show_help = "?",
			},
		},
		textobjects = {
			select = {
				enable = true,

				-- Automatically jump forward to textobj, similar to targets.vim
				lookahead = true,

				keymaps = {
					-- You can use the capture groups defined in textobjects.scm
					["a="] = { query = "@assignment.outer", desc = "Select outer part of an assignment" },
					["i="] = { query = "@assignment.inner", desc = "Select inner part of an assignment" },
					["l="] = { query = "@assignment.lhs", desc = "Select left hand side of an assignment" },
					["r="] = { query = "@assignment.rhs", desc = "Select right hand side of an assignment" },

					-- works for javascript/typescript files (custom capture I created in after/queries/ecma/textobjects.scm)
					["a:"] = { query = "@property.outer", desc = "Select outer part of an object property" },
					["i:"] = { query = "@property.inner", desc = "Select inner part of an object property" },
					["l:"] = { query = "@property.lhs", desc = "Select left part of an object property" },
					["r:"] = { query = "@property.rhs", desc = "Select right part of an object property" },

					["aa"] = { query = "@parameter.outer", desc = "Select outer part of a parameter/argument" },
					["ia"] = { query = "@parameter.inner", desc = "Select inner part of a parameter/argument" },

					["ai"] = { query = "@conditional.outer", desc = "Select outer part of a conditional" },
					["ii"] = { query = "@conditional.inner", desc = "Select inner part of a conditional" },

					["al"] = { query = "@loop.outer", desc = "Select outer part of a loop" },
					["il"] = { query = "@loop.inner", desc = "Select inner part of a loop" },

					["af"] = { query = "@call.outer", desc = "Select outer part of a function call" },
					["if"] = { query = "@call.inner", desc = "Select inner part of a function call" },

					["am"] = { query = "@function.outer", desc = "Select outer part of a method/function definition" },
					["im"] = { query = "@function.inner", desc = "Select inner part of a method/function definition" },

					["ac"] = { query = "@class.outer", desc = "Select outer part of a class" },
					["ic"] = { query = "@class.inner", desc = "Select inner part of a class" },
				},
			},
			swap = {
				enable = true,
				swap_next = {
					["<leader>na"] = "@parameter.inner", -- swap parameters/argument with next
					["<leader>n:"] = "@property.outer", -- swap object property with next
					["<leader>nm"] = "@function.outer", -- swap function with next
				},
				swap_previous = {
					["<leader>pa"] = "@parameter.inner", -- swap parameters/argument with prev
					["<leader>p:"] = "@property.outer", -- swap object property with prev
					["<leader>pm"] = "@function.outer", -- swap function with previous
				},
			},
			fold = {
				enable = true,
			},
		},
	},
	config = function(_, opts)
		require("nvim-treesitter.configs").setup(opts)
	end,
}
