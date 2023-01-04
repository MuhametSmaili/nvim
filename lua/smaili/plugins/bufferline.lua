local M = {
	"akinsho/bufferline.nvim",
	dependencies = { "famiu/bufdelete.nvim" },
	event = "BufReadPost",
}

function M.config()
	require("bufferline").setup({
		options = {
			diagnostics = "nvim_lsp",
			-- diagnostics_indicator = function(count, level)
			-- 	local icon = level:match("error") and "" or ""
			-- 	return count .. " " .. icon
			-- end,
		},
	})
end

return M
