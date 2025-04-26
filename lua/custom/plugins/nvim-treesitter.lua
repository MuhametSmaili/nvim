-------------------------------------------------
-- name : nvim-treesitter
-- url  : https://github.com/nvim-treesitter/nvim-treesitter
-------------------------------------------------
return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	event = "BufReadPost",
	dependencies = {
		{
			"nvim-treesitter/nvim-treesitter-context",
			config = true,
			opts = {
				enable = true,
				-- Avoid the sticky context from growing a lot.
				max_lines = 3,
				-- Match the context lines to the source code.
				multiline_threshold = 1,
				-- Disable it when the window is too small.
				min_window_height = 20,
			},

			keys = {
				{ "<leader>uC", ":TSContextToggle<CR>", desc = "Toggle TSContext" },
				{
					"[c",
					":lua require('treesitter-context').go_to_context()<cr>",
					silent = true,
					desc = "Go to context",
				},
			},
		},
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
	},
	config = function(_, opts)
		require("nvim-treesitter.configs").setup(opts)
	end,
}
