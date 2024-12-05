-------------------------------------------------
-- name : Indent Blankline
-- url  : https://github.com/lukas-reineke/indent-blankline.nvim
-------------------------------------------------
return {
	"lukas-reineke/indent-blankline.nvim",
	event = { "BufReadPost" },
	main = "ibl",
	---@module "ibl"
	---@type ibl.config
	opts = {},
}
