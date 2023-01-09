local M = {
	"lewis6991/gitsigns.nvim",
	event = "VeryLazy",
}

local function keymaps()
	local gitsigns = require("gitsigns")

	return {
		n = {
			["<leader>gd"] = { gitsigns.diffthis, desc = "View git diff" },
			["<leader>gl"] = { gitsigns.blame_line, desc = "View git blame" },
			["<leader>gR"] = { gitsigns.show, desc = "View git revision" },
			["<leader>gh"] = { gitsigns.preview_hunk, desc = "View git hunk per current line" },
			["<leader>gH"] = { gitsigns.get_hunks, desc = "Get git hunks" },
		},
	}
end

function M.config()
	local gitsigns = require("gitsigns")

	gitsigns.setup({})

	-- Git signs
	require("smaili.utils").set_keymappings(keymaps())
end

return M
