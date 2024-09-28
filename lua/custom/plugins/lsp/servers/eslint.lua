return {
	codeAction = {
		disableRuleComment = {
			enable = true,
			location = "separateLine",
		},
		showDocumentation = {
			enable = true,
		},
	},
	codeActionOnSave = {
		enable = false,
		mode = "all",
	},
	format = false, -- Disable formatting
	validate = "off", -- Disable diagnostics
	handlers = {
		-- Suppress "No ESLint configuration found" warnings
		["window/showMessageRequest"] = function(_, result)
			return result
		end,
	},
	on_attach = function(client, _)
		-- Disable formatting and diagnostics capabilities
		client.server_capabilities.documentFormattingProvider = false
		client.server_capabilities.documentRangeFormattingProvider = false
		client.server_capabilities.diagnosticProvider = false
	end,
}
