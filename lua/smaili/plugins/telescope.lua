-------------------------------------------------
-- name : nvim-telescope
-- url  : https://github.com/nvim-treesitter/nvim-treesitter
-------------------------------------------------

local M = {
	"nvim-telescope/telescope.nvim",
	cmd = { "Telescope" },
	dependencies = {
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
			cond = function()
				return vim.fn.executable("make") == 1
			end,
		},
		{ "nvim-telescope/telescope-project.nvim" },
	},
	-- event = "VeryLazy",
	keys = { { "<C-p>" } },
}

local function telescope_keymap()
	local builtin = require("telescope.builtin")

	local keymaps = {
		n = {
			------------------------------
			-- Files
			------------------------------
			["<C-p>"] = {
				function()
					if
						pcall(function()
							-- builtin.git_files({ show_untracked = true })
							-- builtin.git_files()
							--
							builtin.find_files()
						end)
					then
					else
						builtin.find_files()
					end
				end,
				desc = "Serach git/all files",
			},

			------------------------------
			-- GIT
			------------------------------
			-- ["<leader>gb"] = { builtin.git_branches, desc = "Git branches" },
			["<leader>gc"] = { builtin.git_branches, desc = "Git comits" },
			["<leader>gs"] = { builtin.git_branches, desc = "Git status" },

			------------------------------
			-- Search
			------------------------------
			["<leader>sf"] = { builtin.find_files, desc = "Search Files" },
			["<leader>so"] = { builtin.oldfiles, desc = "Search old files" },
			["<leader>sb"] = { builtin.buffers, desc = "Search buffers" },
			["<leader><Tab>"] = { builtin.buffers, desc = "Search buffers" },
			["<leader>sh"] = { builtin.help_tags, desc = "Search for help" },
			["<leader>sm"] = { builtin.man_pages, desc = "Search manual" },
			["<leader>sk"] = { builtin.keymaps, desc = "Search keymaps" },
			["<leader>sc"] = { builtin.commands, desc = "Search commands" },
			["<leader>sr"] = { builtin.registers, desc = "Search registers" },
			["<leader>sw"] = {
				builtin.live_grep,
				desc = "Search words",
			},
			["<leader>sW"] = {
				function()
					builtin.live_grep({
						additional_args = function(args)
							return vim.list_extend(args, { "--hidden", "--no-ignore" })
						end,
					})
				end,
				desc = "Search words in all files",
			},

			------------------------------
			-- Project
			------------------------------
			["<leader>p"] = { ":lua require'telescope'.extensions.project.project{}<CR>", desc = "Search for projects" },

			------------------------------
			-- Find
			------------------------------
			["<leader>fr"] = { builtin.registers, desc = "Find registers" },
		},
	}

	-- require("smaili.utils").set_keymappings(keymaps)
	smaili.set_keymappings(keymaps)
end

function M.config()
	local actions = require("telescope.actions")

	--use FZF if available
	-- pcall(require("telescope").load_extension, "fzf")
	-- pcall(require("telescope").load_extension("project"))

	-- Set keymaps
	telescope_keymap()

	require("telescope").setup({
		defaults = {
			prompt_prefix = " ",
			selection_caret = " ",
			path_display = { "smart" },
			mappings = {
				i = {
					["<C-j>"] = actions.move_selection_next,
					["<C-k>"] = actions.move_selection_previous,
					["<C-c>"] = actions.close,
					["<Down>"] = actions.move_selection_next,
					["<Up>"] = actions.move_selection_previous,
					["<C-u>"] = actions.preview_scrolling_up,
					["<C-d>"] = actions.preview_scrolling_down,
				},
				n = {
					["<esc>"] = actions.close,
					["j"] = actions.move_selection_next,
					["k"] = actions.move_selection_previous,
					["H"] = actions.move_to_top,
					["M"] = actions.move_to_middle,
					["L"] = actions.move_to_bottom,
					["<Down>"] = actions.move_selection_next,
					["<Up>"] = actions.move_selection_previous,
					["gg"] = actions.move_to_top,
					["G"] = actions.move_to_bottom,
					["<C-u>"] = actions.preview_scrolling_up,
					["<C-d>"] = actions.preview_scrolling_down,
				},
			},
		},
		extensions = {
			project = {
				hidden_files = true,
				search_by = "title",
				sync_with_nvim_tree = true,
			},
			fzf = {
				fuzzy = true, -- false will only do exact matching
				override_generic_sorter = true, -- override the generic sorter
				override_file_sorter = true, -- override the file sorter
				case_mode = "smart_case", -- or "ignore_case" or "respect_case"
				-- the default case_mode is "smart_case"
			},
		},
	})
end

return M
