return function(bufnr)
	local keymaps = {
		n = {
			------------------------------
			-- LSP
			------------------------------
			["<leader>cr"] = { "<cmd>Lspsaga rename<CR>", desc = "Rename", buffer = bufnr },
			["<leader>ca"] = { vim.lsp.buf.code_action, desc = "Action", buffer = bufnr },
			["<leader>cD"] = { vim.lsp.buf.type_definition, desc = "Type definition", buffer = bufnr },
			["<leader>cs"] = { "<cmd>FzfLua lsp_document_symbols<CR>", desc = "Document Symbols" },
			["<leader>ci"] = { "<cmd>FzfLua lsp_incoming_calls<CR>", desc = "List incoming calls (FZF)" },
			["<leader>cI"] = { "<cmd>Lspsaga incoming_calls<CR>", desc = "List incoming calls" },
			["<leader>cd"] = { "<cmd>Lspsaga show_line_diagnostics<CR>", desc = "Show diagnostics", buffer = bufnr },
			["<leader>cb"] = {
				"<cmd>FzfLua diagnostics_document<CR>",
				desc = "Show buffer diagnostics",
				buffer = bufnr,
			},
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
			["K"] = { "<cmd>Lspsaga hover_doc<CR>", desc = "Hover Documentation", buffer = bufnr },
			-- ["<C-k>"] = { vim.lsp.buf.signature_help, desc = "Signature Documentation", buffer = bufnr },

			------------------------------
			-- Diagnostic key
			------------------------------
			["[d"] = { "<cmd>Lspsaga diagnostic_jump_prev<CR>", desc = "Go to prev diagnostic" },
			["]d"] = { "<cmd>Lspsaga diagnostic_jump_next<CR>", desc = "Go to prev diagnostic" },

			------------------------------
			-- workspace
			------------------------------
			["<leader>cwa"] = { vim.lsp.buf.add_workspace_folder, desc = "Workspace Add Folder", buffer = bufnr },
			["<leader>cwr"] = { vim.lsp.buf.remove_workspace_folder, desc = "Workspace Remove Folder" },
			["<leader>cwd"] = { ":FzfLua diagnostics_workspace<CR>", desc = "Workspace diagnostics", buffer = bufnr },

			------------------------------
			-- LSP
			------------------------------
			["gd"] = { "<cmd>Lspsaga peek_definition<CR>", desc = "Peek definition", buffer = bufnr },
			["gf"] = { "<cmd>Lspsaga lsp_finder<CR>", desc = "Lsp finder", buffer = bufnr },
			["ga"] = { "<cmd>Lspsaga code_action<CR>", desc = "Code action", buffer = bufnr },
			["gr"] = { ":FzfLua lsp_references<CR>", desc = "Go to refrences", buffer = bufnr },
			["gR"] = { vim.lsp.buf.rename, desc = "Rename", buffer = bufnr },
			["gD"] = { vim.lsp.buf.declaration, desc = "[G]oto [D]eclaration", buffer = bufnr },
			["gI"] = { vim.lsp.buf.implementation, desc = "[G]oto [I]mplementation", buffer = bufnr },
			["gi"] = { "<cmd>Lspsaga goto_definition<CR>", desc = "Go to definition", buffer = bufnr },
			["gt"] = { "<cmd>Lspsaga peek_type_definition<CR>", desc = "Peek type definition", buffer = bufnr },
		},
	}

	custom.set_keymappings(keymaps)
end
