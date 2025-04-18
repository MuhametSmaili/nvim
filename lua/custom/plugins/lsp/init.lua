return {
	{ -- LSP
		"neovim/nvim-lspconfig",
		event = "BufReadPost",
		cmd = { "Mason" },
		dependencies = {
			{ "williamboman/mason.nvim", opts = { ui = { border = "rounded" } }, build = ":MasonUpdate" },
			"williamboman/mason-lspconfig.nvim",
			"echasnovski/mini.icons",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
			{ "j-hui/fidget.nvim", opts = {} },
			"b0o/SchemaStore.nvim",
			"saghen/blink.cmp",
			"rrethy/vim-illuminate",
		},
		opts = {
			lsp_servers = {
				"vimls",
				"html",
				"pbls",
				"vimls",
				"cssls",
				"astro",
			},
			tools = {
				"prettierd",
				"eslint_d",
				-- "quick-lint-js",
				"staticcheck",
				-- "gofumpt",
				"goimports",
				"gotests",
				"golangci-lint",
				"yamllint",
				"write-good",
				"stylua",
			},
		},
		config = function(_, opts)
			----------------------------------
			-- LSP attach
			----------------------------------
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("custom-lsp-attach", { clear = true }),
				callback = function(event)
					----------------------------------
					-- Load key mappings
					----------------------------------
					require("custom.plugins.lsp.keymaps")(event.buf)

					----------------------------------
					-- Add highlights
					----------------------------------
					local client = vim.lsp.get_client_by_id(event.data.client_id)
					if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then
						local highlight_augroup = vim.api.nvim_create_augroup("custom-lsp-highlight", { clear = false })
						vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
							buffer = event.buf,
							group = highlight_augroup,
							callback = vim.lsp.buf.document_highlight,
						})

						vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
							buffer = event.buf,
							group = highlight_augroup,
							callback = vim.lsp.buf.clear_references,
						})

						vim.api.nvim_create_autocmd("LspDetach", {
							group = vim.api.nvim_create_augroup("kickstart-lsp-detach", { clear = true }),
							callback = function(detach_event)
								vim.lsp.buf.clear_references()
								vim.api.nvim_clear_autocmds({
									group = "custom-lsp-highlight",
									buffer = detach_event.buf,
								})
							end,
						})
					end

					----------------------------------
					-- inlay_hint
					----------------------------------
					if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint) then
						vim.keymap.set("n", "<leader>uh", function()
							vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }))
						end, { desc = "Toggle inlay hints", buffer = event.buf })
					end
				end,
			})

			----------------------------------
			-- Server configuration
			----------------------------------
			-- Load server configurations from files
			--  we configure servers on seperate files, if we do not want to change the
			local servers = {}
			local lsp_servers_path = vim.fn.stdpath("config") .. "/lua/custom/plugins/lsp/servers"

			for _, file in ipairs(vim.fn.readdir(lsp_servers_path, [[v:val =~ '\.lua$']])) do
				local server_name = file:gsub("%.lua$", "")
				local server_opts = require("custom.plugins.lsp.servers." .. server_name)
				servers[server_name] = server_opts
			end
			----------------------------------
			-- Add servers automaticlly
			----------------------------------
			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities =
				vim.tbl_deep_extend("force", capabilities, require("blink.cmp").get_lsp_capabilities(capabilities))
			capabilities.workspace.fileOperations = { didRename = true, willRename = true }

			require("mason").setup()
			local ensure_installed = vim.tbl_keys(servers or {})
			vim.list_extend(ensure_installed, opts.lsp_servers)
			vim.list_extend(ensure_installed, opts.tools)

			require("mason-tool-installer").setup({ ensure_installed = ensure_installed, auto_update = true })

			-- LSP borders
			local common_handlers = {
				["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" }),
				["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" }),
			}

			require("mason-lspconfig").setup({
				-- This will loop through the all installed servers
				-- We have configured servers on a file, here we are just apssing the options
				handlers = {
					function(server_name)
						local server_options = servers[server_name] or {}
						server_options.capabilities =
							vim.tbl_deep_extend("force", {}, capabilities, server_options.capabilities or {})
						server_options.handlers =
							vim.tbl_deep_extend("force", {}, common_handlers, server_options.handlers or {})

						require("lspconfig")[server_name].setup(server_options)
					end,
				},
			})

			local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
			vim.diagnostic.config({
				virtual_text = {
					spacing = 4,
					source = "if_many",
					prefix = "●",
				},
				underline = true,
				virtual_lines = false,
				update_in_insert = false,
				document_highlight = {
					enabled = true,
				},
				codelens = {
					enabled = false,
				},
				severity_sort = true,
				float = { border = "rounded" },
				signs = {
					text = {
						[vim.diagnostic.severity.ERROR] = signs.Error,
						[vim.diagnostic.severity.WARN] = signs.Warn,
						[vim.diagnostic.severity.HINT] = signs.Hint,
						[vim.diagnostic.severity.INFO] = signs.Info,
					},
				},
			})
			require("lspconfig.ui.windows").default_options.border = "rounded"
		end,
	},
}
