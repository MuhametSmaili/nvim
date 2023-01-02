local M = {
	name = "jsonls",
}

M.config = {
	settings = {
		json = {
			schemas = require("schemastore").json.schemas(),
			validate = {
				enable = true,
			},
		},
	},
}

return M
