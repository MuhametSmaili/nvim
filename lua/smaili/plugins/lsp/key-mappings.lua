return function(bufnr)
	local keymaps = {
		n = {
			------------------------------
			-- LSP
			------------------------------
			["<leader>lr"] = { "<cmd>Lspsaga rename<CR>", desc = "Rename", buffer = bufnr },
			["<leader>la"] = { vim.lsp.buf.code_action, desc = "Action", buffer = bufnr },
			["<leader>lD"] = { vim.lsp.buf.type_definition, desc = "Type definition", buffer = bufnr },
			["<leader>ls"] = { "<cmd>FzfLua lsp_document_symbols<CR>", desc = "Document Symbols" },
			["<leader>li"] = { "<cmd>Lspsaga incoming_calls<CR>", desc = "List incoming calls" },
			["<leader>lo"] = { "<cmd>Lspsaga outline<CR>", desc = "List file outline" },
			["<leader>lf"] = { ":FormatCurrentBuffer<CR>", desc = "Format document", buffer = bufnr },
			["<leader>ld"] = { "<cmd>Lspsaga show_line_diagnostics<CR>", desc = "Show diagnostics", buffer = bufnr },
			["<leader>lb"] = {
				"<cmd>FzfLua diagnostics_document<CR>",
				desc = "Show buffer diagnostics",
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
			["<leader>lwa"] = { vim.lsp.buf.add_workspace_folder, desc = "Workspace Add Folder", buffer = bufnr },
			["<leader>lwr"] = { vim.lsp.buf.remove_workspace_folder, desc = "Workspace Remove Folder" },
			["<leader>lwd"] = { ":FzfLua diagnostics_workspace<CR>", desc = "Workspace diagnostics", buffer = bufnr },

			------------------------------
			-- LSP
			------------------------------
			["gd"] = { "<cmd>Lspsaga peek_definition<CR>", desc = "Peek definition", buffer = bufnr },
			["gf"] = { "<cmd>Lspsaga lsp_finder<CR>", desc = "Lsp finder", buffer = bufnr },
			["ga"] = { "<cmd>Lspsaga code_action<CR>", desc = "Code action", buffer = bufnr },
			["gr"] = { ":FzfLua lsp_references<CR>", desc = "Go to refrences", buffer = bufnr },
			["gD"] = { vim.lsp.buf.declaration, desc = "[G]oto [D]eclaration", buffer = bufnr },
			["gI"] = { vim.lsp.buf.implementation, desc = "[G]oto [I]mplementation", buffer = bufnr },
			["gi"] = { "<cmd>Lspsaga goto_definition<CR>", desc = "Go to definition", buffer = bufnr },
			["gt"] = { "<cmd>Lspsaga peek_type_definition<CR>", desc = "Peek type definition", buffer = bufnr },
		},
		i = {
			["<C-k>"] = { vim.lsp.buf.signature_help, desc = "Signature Documentation", buffer = bufnr },
		},
	}

	smaili.set_keymappings(keymaps)
end
