-------------------------------------------------
-- name : nvim-telescope
-- url  : https://github.com/nvim-treesitter/nvim-treesitter
-------------------------------------------------

local M = {
	"nvim-telescope/telescope.nvim",
	cmd = { "Telescope" },
	dependencies = {
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	},
	event = "VeryLazy",
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
					if pcall(builtin.git_files) then
					else
						builtin.find_files()
					end
				end,
				desc = "Serach git/all files",
			},

			------------------------------
			-- GIT
			------------------------------
			["<leader>gb"] = { builtin.git_branches, desc = "Git branches" },
			["<leader>gc"] = { builtin.git_branches, desc = "Git comits" },
			["<leader>gs"] = { builtin.git_branches, desc = "Git status" },

			------------------------------
			-- Search
			------------------------------
			["<leader>sf"] = { builtin.find_files, desc = "Search Files" },
      ["<leader>so"] = { builtin.oldfiles, desc = "Search old files" },
      ["<leader>sb"] = { builtin.buffers, desc = "Search buffers" },
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
		},
	}

	require("smaili.utils").set_keymappings(keymaps)
end

function M.config()
	local builtin = require("telescope.builtin")
	local actions = require("telescope.actions")

	--use FZF if available
	pcall(require("telescope").load_extension, "fzf")

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
	})
end

return M
