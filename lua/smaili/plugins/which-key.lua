local M = {
	"folke/which-key.nvim",
	config = true,
	keys = { { "<leader>" } },
}

function M.config()
	local which_key = require("which-key")

	which_key.register({
		["<leader>"] = {
			w = { "Write" },
			q = { "Quit" },
			Q = { "Force quit" },
			h = { "Toggle highlight" },
			r = { "Refactor", { b = "Block refactoring" } },
			c = { "Close buffer" },
			C = { "Force Close buffer" },
			W = { "SUDO write" },
			e = { "Toggle explorer" },
			s = { name = "Search" },
			t = { name = "Terminal" },
			l = { name = "LSP", { w = "Workspace" } },
			u = { name = "UI" },
			g = { name = "GIT", { t = "Toggle" } },
		},
	})

	which_key.setup({
		spelling = {
			enabled = true,
			suggestions = 5,
		},
		window = {
			border = "rounded",
			padding = { 2, 2, 2, 2 },
			margin = { 1, 0, 1, 0 },
		},
	})
end

return M
