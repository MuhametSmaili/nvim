return {
	"cbochs/grapple.nvim",
	opts = {
		scope = "git_branch",
		icons = true,
		status = true,
		-- style = "basename",
	},
	lazy = true,
	cmd = "Grapple",
	keys = {
		{
			"<leader>a",
			function()
				require("grapple").toggle()
			end,
			desc = "Add file to grapple",
		},
		{
			"<c-j>",
			"<cmd>Grapple cycle forward<cr>",
			desc = "Grapple cycle forward",
		},
		{
			"<c-k>",
			"<cmd>Grapple cycle backward<cr>",
			desc = "Grapple cycle backward",
		},
		{
			"<leader>1",
			"<cmd>Grapple select index=1<cr>",
			desc = "Go to 1 file in grapple list",
		},
		{
			"<leader>1",
			"<cmd>Grapple select index=1<cr>",
			desc = "Go to 1 file in grapple list",
		},
		{
			"<leader>2",
			"<cmd>Grapple select index=2<cr>",
			desc = "Go to 2 file in grapple list",
		},
		{
			"<leader>3",
			"<cmd>Grapple select index=3<cr>",
			desc = "Go to 3 file in grapple list",
		},
		{
			"<leader>4",
			"<cmd>Grapple select index=4<cr>",
			desc = "Go to 4 file in grapple list",
		},
		{
			"<leader>m",
			function()
				require("grapple").open_tags()
			end,
			desc = "Toggle grapple UI quick/menu",
		},
		{
			"<c-e>",
			function()
				require("grapple").open_tags()
			end,
			desc = "Toggle grapple UI quick/menu",
		},
	},
}
