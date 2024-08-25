local M = {
	"lewis6991/gitsigns.nvim",
	event = "BufReadPost",
}

local function keymaps()
	local gitsigns = require("gitsigns")

	return {
		n = {
			["<leader>ghd"] = { gitsigns.diffthis, desc = "Diff This" },
			["<leader>ga"] = { gitsigns.get_actions, desc = "Get git actions" },
			["gb"] = { gitsigns.blame_line, desc = "View git blame line" },
			["<leader>gR"] = { gitsigns.show, desc = "View git revision" },
			["<leader>gh"] = { gitsigns.preview_hunk, desc = "View git hunk per current line" },
			["]h"] = { gitsigns.next_hunk, desc = "Next hunk" },
			["[h"] = { gitsigns.prev_hunk, desc = "Prev hunk" },
			["<leader>ghr"] = { gitsigns.reset_hunk, desc = "Reset current hunk" },
			["<leader>gH"] = { gitsigns.get_hunks, desc = "Get git hunks" },
			["<leader>gtd"] = { gitsigns.toggle_deleted, desc = "Git toggle deleted" },
			["<leader>gts"] = { gitsigns.toggle_signs, desc = "Git toggle signs" },
			["<leader>gtw"] = { gitsigns.toggle_word_diff, desc = "Git toggle word diff" },
		},
	}
end

function M.config()
	local gitsigns = require("gitsigns")

	gitsigns.setup({
		signs = {
			add = { text = "▎" },
			change = { text = "▎" },
			delete = { text = "契" },
			topdelete = { text = "契" },
			changedelete = { text = "▎" },
			untracked = { text = "▎" },
		},
		current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
	})

	-- Git signs
	custom.set_keymappings(keymaps())
end

return M
