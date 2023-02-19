return function(bufnr)
	local builtin = require("telescope.builtin")

	local keymaps = {
		n = {
			------------------------------
			-- LSP
			------------------------------
			["<leader>lr"] = { "<cmd>Lspsaga rename<CR>", desc = "Rename", buffer = bufnr },
			["<leader>la"] = { vim.lsp.buf.code_action, desc = "Action", buffer = bufnr },
			["<leader>lD"] = { vim.lsp.buf.type_definition, desc = "Type definition", buffer = bufnr },
			["<leader>ls"] = { builtin.lsp_document_symbols, desc = "Document Symbols" },
			["<leader>li"] = { "<cmd>Lspsaga incoming_calls<CR>", desc = "List incoming calls" },
			-- ["<leader>lo"] = { "<cmd>Lspsaga outgoing_calls<CR>", desc = "List outgoing calls" },
			["<leader>lo"] = { "<cmd>Lspsaga outline<CR>", desc = "List file outline" },
			["<leader>lws"] = { builtin.lsp_dynamic_workspace_symbols, desc = "Workspace Symbols", buffer = bufnr },
			["<leader>lf"] = { ":FormatCurrentBuffer<CR>", desc = "Format document", buffer = bufnr },
			["<leader>ld"] = { "<cmd>Lspsaga show_line_diagnostics<CR>", desc = "Show diagnostics", buffer = bufnr },
			["<leader>lb"] = {
				"<cmd>Lspsaga show_buf_diagnostics<CR>",
				desc = "Show buffer diagnostics",
				buffer = bufnr,
			},

			------------------------------
			-- Hover
			------------------------------
			["K"] = { "<cmd>Lspsaga hover_doc<CR>", desc = "Hover Documentation", buffer = bufnr },
			["<C-k>"] = { vim.lsp.buf.signature_help, desc = "Signature Documentation", buffer = bufnr },

			------------------------------
			-- Diagnostic key
			------------------------------
			["[d"] = { "<cmd>vim.diagnostic.goto_prev<cr>" },
			["]d"] = { "<cmd>vim.diagnostic.goto_prev<cr>" },

			------------------------------
			-- workspace
			------------------------------
			["<leader>lwa"] = { vim.lsp.buf.add_workspace_folder, desc = "Workspace Add Folder", buffer = bufnr },
			["<leader>lwr"] = { vim.lsp.buf.remove_workspace_folder, desc = "Workspace Remove Folder" },

			------------------------------
			-- LSP
			------------------------------
			["gd"] = { "<cmd>Lspsaga peek_definition<CR>", desc = "[G]oto [D]efinition", buffer = bufnr },
			["gf"] = { "<cmd>Lspsaga lsp_finder<CR>", desc = "[G]oto [D]efinition", buffer = bufnr },
			["ga"] = { "<cmd>Lspsaga code_action<CR>", desc = "[G]oto [D]efinition", buffer = bufnr },
			["gr"] = { builtin.lsp_references, desc = "[G]oto [R]eferences", buffer = bufnr },
			["gD"] = { vim.lsp.buf.declaration, desc = "[G]oto [D]eclaration", buffer = bufnr },
			["gI"] = { vim.lsp.buf.implementation, desc = "[G]oto [I]mplementation", buffer = bufnr },
		},
		i = {
			["<C-k>"] = { vim.lsp.buf.signature_help, desc = "Signature Documentation", buffer = bufnr },
		},
	}

	smaili.set_keymappings(keymaps)
end
