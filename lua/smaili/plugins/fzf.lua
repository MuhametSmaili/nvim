-------------------------------------------------
-- name : fzf-lua
-- url  : https://github.com/ibhagwan/fzf-lua
---------------------------------------------------
return {
	"ibhagwan/fzf-lua",
	cmd = "FzfLua",
	keys = {
		{ "<C-p>", ":FzfLua files<cr>", desc = "Find files" },
		{ "<leader>sw", ":FzfLua live_grep<cr>", desc = "Find word (live_grep)" },
		{ "<leader><tab>", ":FzfLua buffers<cr>", desc = "Find buffers" },
		{ "<leader>sr", ":FzfLua registers <cr>", desc = "Search registers" },
		{ "<leader>sm", ":FzfLua man_pages <cr>", desc = "Search manual pages" },
		{ "<leader>sk", ":FzfLua keymaps <cr>", desc = "Search key mappings" },
		{ "<leader>sj", ":FzfLua keymaps <cr>", desc = "Search jumps" },
	},
	opts = {
		previewers = {
			git_diff = {
				pager = "delta --width=$FZF_PREVIEW_COLUMNS",
			},
		},
		git = {
			bcommits = {
				preview_pager = "delta --width=$FZF_PREVIEW_COLUMNS",
			},
		},
		winopts = {
			on_create = function()
				vim.api.nvim_buf_set_keymap(0, "t", "<C-j>", "<Down>", { silent = true, noremap = true })
				vim.api.nvim_buf_set_keymap(0, "t", "<C-k>", "<Up>", { silent = true, noremap = true })
			end,
			winopts = {
				relativenumber = true,
			},
		},
		keymap = {
			builtin = {
				["<F1>"] = "toggle-help",
				["<F2>"] = "toggle-fullscreen",
				-- Only valid with the 'builtin' previewer
				["<F3>"] = "toggle-preview-wrap",
				["<F4>"] = "toggle-preview",
				-- Rotate preview clockwise/counter-clockwise
				["<F5>"] = "toggle-preview-ccw",
				["<F6>"] = "toggle-preview-cw",
				["<C-d>"] = "preview-page-down",
				["<C-u>"] = "preview-page-up",
				["<S-left>"] = "preview-page-reset",
			},
		},
	},
}
