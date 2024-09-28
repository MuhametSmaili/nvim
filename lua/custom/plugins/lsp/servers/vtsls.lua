return {
	settings = {
		complete_function_calls = true,
		vtsls = {
			enableMoveToFileCodeAction = true,
			autoUseWorkspaceTsdk = true,
			experimental = {
				completion = {
					enableServerSideFuzzyMatch = true,
				},
			},
		},
		typescript = {
			updateImportsOnFileMove = { enabled = "always" },
			-- organizeImportsOnSave = true, -- Automatically organize imports on save
			-- removeUnusedImports = true, -- Automatically remove unused imports
			suggest = {
				completeFunctionCalls = true,
				includeCompletionsForModuleExports = true, -- Suggest exports from other modules
				includeAutomaticOptionalChainCompletions = true, -- Auto-complete with optional chaining where applicable
			},
			compilerOptions = {
				strict = true, -- Enable strict type checks
				strictNullChecks = true, -- Enforce null safety
				strictPropertyInitialization = true, -- Ensure all properties are initialized
			},
			inlayHints = {
				enumMemberValues = { enabled = true },
				functionLikeReturnTypes = { enabled = true },
				parameterNames = { enabled = "literals" },
				parameterTypes = { enabled = true },
				propertyDeclarationTypes = { enabled = true },
				variableTypes = { enabled = false },
			},
			diagnostics = {
				diagnosticsDelay = "500ms", -- diagnostic feedback
				enableUnused = true, -- Highlight unused variables
				enableUnreachableCode = true, -- Highlight unreachable code
			},
		},
	},
}
