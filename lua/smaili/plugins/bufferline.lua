local M = {
	"akinsho/bufferline.nvim",
	event = "BufReadPost",
}

function M.config()
	require("bufferline").setup({
		options = {
			diagnostics = "nvim_lsp",
			offsets = {
				{ filetype = "NvimTree", separator = true, text = "" },
			},
			buffer_close_icon = "",
			indicator = {
				style = "underline",
			},
		},
	})
end

return M
