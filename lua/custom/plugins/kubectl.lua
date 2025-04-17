return {
	{
		keys = {
			{ "<leader>K", "<cmd>lua require('kubectl').toggle()<cr>", desc = "Open kubectl" },
		},
		"ramilito/kubectl.nvim",
		config = function()
			require("kubectl").setup()
		end,
	},
}
