local M = {
	"lewis6991/gitsigns.nvim",
	event = "BufReadPost",
}

local function keymaps()
	local gitsigns = require("gitsigns")

	return {
		n = {
			["<leader>gd"] = { gitsigns.diffthis, desc = "View git diff" },
			["<leader>ga"] = { gitsigns.get_actions, desc = "Get git actions" },
			["gb"] = { gitsigns.blame_line, desc = "View git blame" },
			["<leader>gR"] = { gitsigns.show, desc = "View git revision" },
			["<leader>gh"] = { gitsigns.preview_hunk, desc = "View git hunk per current line" },
			["]h"] = { gitsigns.next_hunk, desc = "Next hunk" },
			["[h"] = { gitsigns.prev_hunk, desc = "Prev hunk" },
			["<leader>gr"] = { gitsigns.reset_hunk, desc = "Reset current hunk" },
			["<leader>gH"] = { gitsigns.get_hunks, desc = "Get git hunks" },
			["<leader>gtd"] = { gitsigns.toggle_deleted, desc = "Git toggle deleted" },
			["<leader>gts"] = { gitsigns.toggle_signs, desc = "Git toggle signs" },
			["<leader>gtw"] = { gitsigns.toggle_word_diff, desc = "Git toggle word diff" },
			["<leader>gc"] = { ":FzfLua git_commits<cr>", desc = "View git commits for this buffer" },
			["<leader>gs"] = { ":FzfLua git_status<cr>", desc = "Git status" },
			["<leader>gb"] = { ":FzfLua git_bcommits<cr>", desc = "Git buffer commits" },
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

	-- Git signs keymaps
	custom_util.set_keymappings(keymaps())
end

return M
