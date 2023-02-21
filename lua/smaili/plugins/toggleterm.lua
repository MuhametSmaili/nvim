-------------------------------------------------
-- name : toggleterm-nvim
-- url  : https://github.com/akinsho/toggleterm.nvim
-------------------------------------------------

return {
	"akinsho/toggleterm.nvim",
	keys = {
		{ "<leader>tf", ":ToggleTerm direction=float<CR>", desc = "Toggle terminal float" },
		{ "<C-`>", ":ToggleTerm direction=float<CR>", desc = "Toggle terminal float" },
	},
	opts = {
		open_mapping = [[<c-`>]],
	},
}
