-------------------------------------------------
-- name : fzf-lua
-- url  : https://github.com/ibhagwan/fzf-lua
---------------------------------------------------
return {
	"ibhagwan/fzf-lua",
	cmd = "FzfLua",
	keys = {
		{ "<C-p>", ":FzfLua files<cr>", desc = "Find files" },
		{ "<leader>s<", "<cmd>FzfLua resume<cr>", desc = "Resume last command" },
		{ "<leader>sw", "<cmd>FzfLua live_grep_glob<cr>", desc = "Find word (grep project)" },
		{ "<leader>sb", "<cmd>FzfLua lgrep_curbuf<cr>", desc = "Find word in buffer" },
		{ "<leader>sw", "<cmd>FzfLua grep_visual<cr>", desc = "Grep", mode = "x" },
		{
			"<leader>of",
			":lua require'fzf-lua'.files({ cwd='~/vaults/personal' })<CR>",
			desc = "Find obsidian files",
			mode = "n",
		},
		{
			"<leader>ow",
			":lua require'fzf-lua'.live_grep_glob({ cwd='~/vaults/personal' })<CR>",
			desc = "Find obsidian words ",
			mode = "n",
		},
		{ "<leader><tab>", ":FzfLua buffers<cr>", desc = "Find buffers" },
		{ "<leader>sr", ":FzfLua registers <cr>", desc = "Search registers" },
		{ "<leader>sc", ":FzfLua colorschemes<cr>", desc = "Search colorschemes" },
		{ "<leader>sh", ":FzfLua help_tags<cr>", desc = "Search help tags" },
		{ "<leader>sH", ":FzfLua highlights<cr>", desc = "Search highlights" },
		{ "<leader>sm", ":FzfLua marks <cr>", desc = "Search marks" },
		{ "<leader>sM", ":FzfLua man_pages <cr>", desc = "Search manual pages" },
		{ "<leader>sk", ":FzfLua keymaps <cr>", desc = "Search key mappings" },
		{ "<leader>ss", ":FzfLua spell_suggest <cr>", desc = "Show spell suggestions" },
		{ "<leader>sJ", ":FzfLua jumps <cr>", desc = "Search jumps" },
		{
			"<leader>gb",
			function()
				require("fzf-lua").git_bcommits({
					fzf_opts = {
						["--preview-window"] = "nohidden,down,70%,border-top,+{3}+3/3,~3",
					},
				})
			end,
			desc = "Git buffer commits",
		},
		{
			"<leader>gA",
			function()
				require("fzf-lua").fzf_live(
					"git rev-list --all | xargs git grep --line-number --column --color=always <query>",
					{
						fzf_opts = {
							["--delimiter"] = ":",
							["--preview-window"] = "nohidden,down,60%,border-top,+{3}+3/3,~3",
						},
						preview = "git show {1}:{2} | "
							.. "bat --style=default --color=always --file-name={2} --highlight-line={3}",
					}
				)
			end,
			desc = "Git grap all GIT history",
		},
		{
			"<leader>st",
			"<cmd>lua require('fzf-lua').grep({search='TODO|HACK|PERF|NOTE|FIX', no_esc=true})<CR>",
			desc = "Search tags TODO|FIX|PERF|FIX...",
		},
		{ "gr", ":FzfLua lsp_references<CR>", desc = "Go to refrences" },
	},
	opts = {
		"default",
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
			fzf = {
				["alt-a"] = "toggle-all",
				-- Only valid with fzf previewers (bat/cat/git/etc)
				["ctrl-d"] = "preview-page-down",
				["ctrl-u"] = "preview-page-up",
				["ctrl-q"] = "select-all+accept",
			},
		},
		lsp = {
			code_actions = {
				previewer = "codeaction_native",
				preview_pager = "delta --side-by-side --width=$FZF_PREVIEW_COLUMNS --hunk-header-style='omit' --file-style='omit'",
				layout = "flex",
			},
		},
	},
}
