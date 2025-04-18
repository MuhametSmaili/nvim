-------------------------------------------------
-- name : fzf-lua
-- url  : https://github.com/ibhagwan/fzf-lua
---------------------------------------------------
return {
	"ibhagwan/fzf-lua",
	cmd = "FzfLua",
	lazy = false,
	keys = {
		{
			"<C-p>",
			":FzfLua files<cr>",
			desc = "Find files",
		},
		{ "<leader>s,", "<cmd>FzfLua resume<cr>", desc = "Resume last command" },
		-- { "<leader>sw", ":lua require'fzf-lua'.live_grep({ multiprocess=true })<CR>", desc = "Find word (live_grep)" },
		{ "<leader>sw", "<cmd>FzfLua live_grep<cr>", desc = "Find word (grep project)" },
		{
			"<leader>sW",
			':lua require"fzf-lua".live_grep({ cmd = "git grep --line-number --files-with-matches --column --color=always" })<cr>',
			desc = "Find word (grep project)",
		},
		{
			"<leader>,",
			function()
				require("fzf-lua").oldfiles({
					cwd_only = true,
					stat_file = true, -- verify files exist on disk
				})
			end,
			desc = "Find word in buffer",
		},
		{ "<leader>sb", "<cmd>FzfLua lgrep_curbuf<cr>", desc = "Find word in buffer" },
		{ "<leader>sg", "<cmd>FzfLua git_status<cr>", desc = "Find word in buffer" },
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
		-- {
		--   "<leader>sW",
		--   ":lua require'fzf-lua'.grep_project({ multiprocess=true })<CR>",
		--   desc = "Find word (grep project)",
		-- },
		{ "<leader><tab>", ":FzfLua buffers<cr>", desc = "Find buffers" },
		{ "<leader>sR", ":FzfLua registers <cr>", desc = "Search registers" },
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
						-- ["--preview-window"] = "nohidden,down,70%,border-top,+{3}+3/3,~3",
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
							-- ["--preview-window"] = "nohidden,down,60%,border-top,+{3}+3/3,~3",
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
		{ "z=", "<cmd>FzfLua spell_suggest<cr>", desc = "Spelling suggestions" },
	},
	opts = function()
		return {
			"fzf-native",
			-- "default",
			defaults = {
				-- formatter = "path.filename_first",
			},
			oldfiles = {
				include_current_session = true,
			},
			-- previewers = {
			--   git_diff = {
			--     pager = "delta --width=$FZF_PREVIEW_COLUMNS",
			--   },
			-- },
			-- git = {
			-- bcommits = {
			--   preview_pager = "delta --width=$FZF_PREVIEW_COLUMNS",
			-- },
			-- },
			winopts = {
				on_create = function()
					vim.api.nvim_buf_set_keymap(0, "t", "<C-j>", "<Down>", { silent = true, noremap = true })
					vim.api.nvim_buf_set_keymap(0, "t", "<C-k>", "<Up>", { silent = true, noremap = true })
				end,
				winopts = {
					relativenumber = true,
				},
				on_close = function()
					print("on_exit")
					vim.cmd("stopinsert") -- Exit insert mode on close
				end,
				on_exit = function()
					print("on_exit")
					vim.cmd("stopinsert") -- Ensure cleanup after exit
				end,
			},
			on_close = function()
				print("on_exit")
				vim.cmd("stopinsert") -- Exit insert mode on close
			end,
			on_exit = function()
				print("on_exit")
				vim.cmd("stopinsert") -- Ensure cleanup after exit
			end,
			keymap = {
				-- builtin = {
				-- 	["<F1>"] = "toggle-help",
				-- 	["<F2>"] = "toggle-fullscreen",
				-- 	-- Only valid with the 'builtin' previewer
				-- 	["<F3>"] = "toggle-preview-wrap",
				-- 	["<F4>"] = "toggle-preview",
				-- 	-- Rotate preview clockwise/counter-clockwise
				-- 	["<F5>"] = "toggle-preview-ccw",
				-- 	["<F6>"] = "toggle-preview-cw",
				["<C-d>"] = "preview-page-down",
				["<C-u>"] = "preview-page-up",
				-- 	["<S-left>"] = "preview-page-reset",
				-- },
				fzf = {
					-- fzf '--bind=' options
					-- ["ctrl-z"] = "abort",
					-- ["ctrl-u"] = "unix-line-discard",
					-- ["ctrl-f"] = "half-page-down",
					-- ["ctrl-b"] = "half-page-up",
					-- ["ctrl-a"] = "beginning-of-line",
					-- ["ctrl-e"] = "end-of-line",
					["alt-a"] = "toggle-all",
					-- Only valid with fzf previewers (bat/cat/git/etc)
					-- ["f3"] = "toggle-preview-wrap",
					-- ["f4"] = "toggle-preview",
					-- ["<C-d>"] = "preview-page-down",
					-- ["<C-u>"] = "preview-page-up",
					["ctrl-d"] = "preview-page-down",
					["ctrl-u"] = "preview-page-up",
					["ctrl-q"] = "select-all+accept",
				},
			},
			actions = {
				files = {
					true,
					-- 		["<c-q>"] = function()
					-- 			require("fzf-lua.actions").toggle_hidden()
					-- 		end,
				},
			},
			files = {
				git_icons = true,
				multiprocess = true,
				-- ["<c-g>"] = require("fzf-lua").actions.toggle_hidden,
			},
			lsp = {
				code_actions = {
					winopts = {
						width = 70,
						height = 20,
						relative = "cursor",
						preview = {
							hidden = true,
							vertical = "down:50%",
						},
					},
				},
			},
		}
	end,
}
