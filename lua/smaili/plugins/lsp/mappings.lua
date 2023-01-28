return function(bufnr)
	local builtin = require("telescope.builtin")

	local keymaps = {
		n = {
			------------------------------
			-- LSP
			------------------------------
			["<leader>lr"] = { vim.lsp.buf.rename, desc = "Rename", buffer = bufnr },
			["<leader>la"] = { vim.lsp.buf.code_action, desc = "Action", buffer = bufnr },
			["<leader>lD"] = { vim.lsp.buf.type_definition, desc = "Type definition", buffer = bufnr },
			["<leader>ls"] = { builtin.lsp_document_symbols, desc = "Document Symbols" },
			["<leader>li"] = { builtin.lsp_incoming_calls, desc = "List incoming calls" },
			["<leader>lws"] = { builtin.lsp_dynamic_workspace_symbols, desc = "Workspace Symbols", buffer = bufnr },
			["<leader>lf"] = { ":FormatCurrentBuffer<CR>", desc = "Format document", buffer = bufnr },
			["<leader>ld"] = {
				function()
					vim.diagnostic.open_float()
				end,
				desc = "Show diagnostics",
				buffer = bufnr,
			},

			------------------------------
			-- Hover
			------------------------------
			["K"] = { vim.lsp.buf.hover, desc = "Hover Documentation", buffer = bufnr },
			["<C-k>"] = { vim.lsp.buf.signature_help, desc = "Signature Documentation", buffer = bufnr },

			------------------------------
			-- workspace
			------------------------------
			["<leader>lwa"] = { vim.lsp.buf.add_workspace_folder, desc = "Workspace Add Folder", buffer = bufnr },
			["<leader>lwr"] = { vim.lsp.buf.remove_workspace_folder, desc = "Workspace Remove Folder" },
			["<leader>lwl"] = {
				function()
					print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
				end,
				desc = "[W]orkspace [L]ist Folders",
			},

			-- G
			["<gd>"] = { vim.lsp.buf.definition, desc = "[G]oto [D]efinition", buffer = bufnr },
			["<gr>"] = { builtin.lsp_references, desc = "[G]oto [R]eferences" },
			["<gD>"] = { vim.lsp.buf.declaration, desc = "[G]oto [D]eclaration" },
			["<gI>"] = { vim.lsp.buf.implementation, desc = "[G]oto [I]mplementation" },
		},
		i = {
			["<C-k>"] = { vim.lsp.buf.signature_help, desc = "Signature Documentation", buffer = bufnr },
		},
	}

	require("smaili.utils").set_keymappings(keymaps)
end
