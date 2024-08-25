return {
	{ "echasnovski/mini.ai", opts = {}, event = { "BufReadPost" } },
	{
		"echasnovski/mini.icons",
		opts = {},
		lazy = false,
		specs = {
			{ "nvim-tree/nvim-web-devicons", enabled = false, optional = true },
		},
		init = function()
			package.preload["nvim-web-devicons"] = function()
				require("mini.icons").mock_nvim_web_devicons()
				return package.loaded["nvim-web-devicons"]
			end
		end,
	},
	{ "echasnovski/mini.pairs", opts = {}, event = { "InsertEnter" } },
}
