return {
	"otavioschwanck/arrow.nvim",
	dependencies = {
		{ "echasnovski/mini.icons" },
	},
	keys = {
		{ "m", mode = "n" },
		{ "<leader>;", mode = "n" },
		{
			"<leader>a",
			function()
				return require("arrow.persist").toggle()
			end,
			mode = "n",
		},
	},
	opts = {
		leader_key = "<leader>;",
		buffer_leader_key = "m",
		show_icons = true,
		always_show_path = true,
		hide_handbook = true,
		hide_buffer_handbook = true,
		separate_by_branch = true,
		per_buffer_config = {
			sort_automatically = false,
		},
		global_bookmarks = false,
		index_keys = "hjkl;afg123456789zxcbnmZXVBNM,afgAFGHJKLwrtyuiopWRTYUIOP",
	},
}
