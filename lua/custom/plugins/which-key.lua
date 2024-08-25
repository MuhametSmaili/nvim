local M = {
	"folke/which-key.nvim",
	config = true,
	keys = { { "<leader>" } },
}

function M.config()
	local which_key = require("which-key")

	-- which_key.add({
	-- {
	-- 	["<leader>"] = {
	-- 		w = { "Write" },
	-- 		q = { "Quit" },
	-- 		Q = { "Force quit" },
	-- 		h = { "Toggle highlight" },
	-- 		r = { "Refactor", { b = "Block refactoring" } },
	-- 		b = { "Buffer" },
	-- 		C = { "Force Close buffer" },
	-- 		W = { "SUDO write" },
	-- 		e = { "Toggle explorer" },
	-- 		s = { name = "Search" },
	-- 		t = { name = "Terminal" },
	-- 		c = { name = "Code", { w = "Workspace" } },
	-- 		u = { name = "UI" },
	-- 		g = { name = "GIT", { t = "Toggle" } },
	-- 	},
	-- },
	-- { ["g?"] = "Debug" },
	-- })

	which_key.setup({})
end

return M
