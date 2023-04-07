return {
	"acksld/nvim-neoclip.lua",
	dependencies = {
		{ "kkharji/sqlite.lua" },
	},
	event = "VeryLazy",
	keys = { { "<leader>sn", ":lua require('neoclip.fzf')()<cr>", desc = "Find registers (neoclip)" } },
	opts = {
		enable_persistent_history = true,
	},
}
