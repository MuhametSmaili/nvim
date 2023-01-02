local M = {
	name = "tsserver",
}

M.config = {
	on_init = function(client)
		client.server_capabilities.documentFormattingProvider = false
		client.server_capabilities.documentFormattingRangeProvider = false
	end,
}

return M
