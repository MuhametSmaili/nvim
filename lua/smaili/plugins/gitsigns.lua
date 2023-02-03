local M = {
	"lewis6991/gitsigns.nvim",
	event = "VeryLazy",
}

local function keymaps()
	local gitsigns = require("gitsigns")

	return {
		n = {
			["<leader>gd"] = { gitsigns.diffthis, desc = "View git diff" },
			["<leader>ga"] = { gitsigns.get_actions, desc = "Get git actions" },
			["<leader>gl"] = { gitsigns.blame_line, desc = "View git blame" },
			["<leader>gR"] = { gitsigns.show, desc = "View git revision" },
			["<leader>gh"] = { gitsigns.preview_hunk, desc = "View git hunk per current line" },
			["<leader>gr"] = { gitsigns.reset_hunk, desc = "Reset current hunk" },
			["<leader>gH"] = { gitsigns.get_hunks, desc = "Get git hunks" },
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
	require("smaili.utils").set_keymappings(keymaps())
end

return M
