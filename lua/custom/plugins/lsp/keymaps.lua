return function(bufnr)
	local keymaps = {
		n = {
			------------------------------
			-- LSP
			------------------------------
			["<leader>cr"] = { vim.lsp.buf.rename, desc = "Rename", buffer = bufnr },
			["<leader>ca"] = { vim.lsp.buf.code_action, desc = "Action", buffer = bufnr },
			["<leader>cD"] = { vim.lsp.buf.type_definition, desc = "Type definition", buffer = bufnr },
			["<leader>cs"] = { "<cmd>FzfLua lsp_document_symbols<CR>", desc = "Document Symbols" },
			["<leader>ci"] = { "<cmd>FzfLua lsp_incoming_calls<CR>", desc = "List incoming calls (FZF)" },
			["<leader>cd"] = { vim.diagnostic.open_float, desc = "Show diagnostics", buffer = bufnr },
			-- ["<leader>cb"] = {
			-- 	vim.diagnostic.,
			-- 	desc = "Show buffer diagnostics",
			-- 	buffer = bufnr,
			-- },
			-- Toggle inlay hint
			["<leader>ui"] = {
				function()
					vim.lsp.buf.inlay_hint(bufnr)
				end,
				desc = "Toggle inlay hint",
				buffer = bufnr,
			},

			------------------------------
			-- Hover
			------------------------------
			["K"] = { vim.lsp.buf.hover, desc = "Hover Documentation", buffer = bufnr },
			-- ["<C-k>"] = { vim.lsp.buf.signature_help, desc = "Signature Documentation", buffer = bufnr },

			------------------------------
			-- Diagnostic key
			------------------------------
			["[d"] = { vim.diagnostic.get_prev, desc = "Go to prev diagnostic" },
			["]d"] = { vim.diagnostic.get_next, desc = "Go to next diagnostic" },

			------------------------------
			-- workspace
			------------------------------
			["<leader>cwa"] = { vim.lsp.buf.add_workspace_folder, desc = "Workspace Add Folder", buffer = bufnr },
			["<leader>cwr"] = { vim.lsp.buf.remove_workspace_folder, desc = "Workspace Remove Folder" },
			["<leader>cwd"] = { ":FzfLua diagnostics_workspace<CR>", desc = "Workspace diagnostics", buffer = bufnr },

			------------------------------
			-- LSP
			------------------------------
			["gd"] = { vim.lsp.buf.definition, desc = "Peek definition", buffer = bufnr },
			["ga"] = { vim.lsp.buf.code_action, desc = "Code action", buffer = bufnr },
			["gR"] = { vim.lsp.buf.rename, desc = "Rename", buffer = bufnr },
			["gD"] = { vim.lsp.buf.declaration, desc = "[G]oto [D]eclaration", buffer = bufnr },
			["gI"] = { vim.lsp.buf.implementation, desc = "[G]oto [I]mplementation", buffer = bufnr },
		},
	}

	custom.set_keymappings(keymaps)
end
