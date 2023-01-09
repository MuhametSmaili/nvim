local M = {
	"akinsho/bufferline.nvim",
	dependencies = { "famiu/bufdelete.nvim" },
	event = "BufReadPost",
}

function M.config()
	require("bufferline").setup({
		options = {
			diagnostics = "nvim_lsp",
			offsets = {
				{ filetype = "NvimTree", separator = true, text = "" },
			},
		},
	})
end

return M
