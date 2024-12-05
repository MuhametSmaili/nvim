-- Toggle virtual_text
local virtual_text_enabled = false

function ToggleVirtualText()
	virtual_text_enabled = not virtual_text_enabled
	vim.diagnostic.config({
		virtual_text = virtual_text_enabled,
	})
	print("Virtual Text: " .. (virtual_text_enabled and "On" or "Off"))
end

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
			-- ["<leader>cd"] = { "<cmd>FzfLua lsp_document_diagnostics<CR>", desc = "Show diagnostics", buffer = bufnr },
			-- ["<leader>cb"] = {
			-- 	vim.diagnostic.,
			-- 	desc = "Show buffer diagnostics",
			-- 	buffer = bufnr,
			-- },
			------------------------------
			-- Hover
			------------------------------
			["K"] = { vim.lsp.buf.hover, desc = "Hover Documentation", buffer = bufnr },
			-- ["<C-k>"] = { vim.lsp.buf.signature_help, desc = "Signature Documentation", buffer = bufnr },

			------------------------------
			-- Diagnostic key
			------------------------------
			-- ["]d"] = { vim.diagnostic.get_next, desc = "Go to next diagnostic" },
			-- ["[d"] = { vim.diagnostic.get_prev, desc = "Go to prev diagnostic" },

			------------------------------
			-- workspace
			------------------------------
			["<leader>cwa"] = { vim.lsp.buf.add_workspace_folder, desc = "Workspace Add Folder", buffer = bufnr },
			["<leader>cwr"] = { vim.lsp.buf.remove_workspace_folder, desc = "Workspace Remove Folder" },
			["<leader>cwd"] = { ":FzfLua diagnostics_workspace<CR>", desc = "Workspace diagnostics", buffer = bufnr },

			------------------------------
			-- LSP
			------------------------------
			-- ["gd"] = { vim.lsp.buf.definition, desc = "Peek definition", buffer = bufnr },
			["gd"] = { ":FzfLua lsp_definitions<CR>", desc = "Peek definition", buffer = bufnr },
			["gt"] = { ":FzfLua lsp_typedefs<CR>", desc = "Peek definition", buffer = bufnr },
			["ga"] = {
				function()
					require("fzf-lua").lsp_code_actions({
						winopts = {
							relative = "cursor",
							width = 0.6,
							height = 0.6,
							row = 1,
							preview = { horizontal = "up:70%" },
						},
						multiprocess = true,
					})
				end,
				desc = "Code action",
				buffer = bufnr,
			},
			["gR"] = { vim.lsp.buf.rename, desc = "Rename", buffer = bufnr },
			-- ["gD"] = { vim.lsp.buf.declaration, desc = "[G]oto [D]eclaration", buffer = bufnr },
			["gD"] = {
				function()
					require("fzf-lua").lsp_definitions({ jump_to_single_result = true })
				end,
				desc = "[G]oto [D]eclaration",
				buffer = bufnr,
			},
			-- ["gI"] = { vim.lsp.buf.implementation, desc = "[G]oto [I]mplementation", buffer = bufnr },
			["gI"] = { ":FzfLua lsp_implementations<CR>", desc = "[G]oto [I]mplementation", buffer = bufnr },
			["<leader>uv"] = { ":lua ToggleVirtualText()<CR>", desc = "Toggle Virtual Text", buffer = bufnr },
		},
	}

	custom.set_keymappings(keymaps)
end
