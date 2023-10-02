-------------------------------------------------
-- name : Indent Blankline
-- url  : https://github.com/lukas-reineke/indent-blankline.nvim
-------------------------------------------------
return {
	"lukas-reineke/indent-blankline.nvim",
	event = { "BufReadPost" },
	main = "ibl",
	opts = {
		indent = {
			char = "┊",
		},
		whitespace = {
			remove_blankline_trail = false,
		},
		scope = {
			-- char = "│",
			enabled = true,
			show_start = false,
		},
	},
}
