return {
	{ -- LSP
		"neovim/nvim-lspconfig",
		event = "BufReadPost",
		cmd = { "Mason" },
		dependencies = {
			{ "williamboman/mason.nvim", opts = {}, run = ":MasonUpdate" }, -- installing LSPs automaticlly
			"williamboman/mason-lspconfig.nvim", -- lsp configuration for mason lsp
			"echasnovski/mini.icons",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
			{ "j-hui/fidget.nvim", opts = {} },
			-- Autoformatting
			"stevearc/conform.nvim",
			"b0o/SchemaStore.nvim",
			"hrsh7th/cmp-nvim-lsp",
			"rrethy/vim-illuminate",
		},
		opts = {
			servers = {
				"prettier",
				"eslint_d",
				"golines",
				"bashls",
				"vim-language-server",
				"golangci-lint",
				"yamllint",
				"html",
				"dockerls",
				"lua-language-server",
				"docker_compose_language_service",
				"vimls",
				"cssls",
				"stylua",
				"astro",
			},
		},
		config = function(_, opts)
			-- LSP Attach
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
							group = vim.api.nvim_create_augroup("kickstart-lsp-highlight", { clear = true }),
							callback = function(event2)
								vim.lsp.buf.clear_references()
								vim.api.nvim_clear_autocmds({ group = "custom-lsp-highlight", buffer = event2.buf })
							end,
						})
					end

					----------------------------------
					-- inlay_hint
					----------------------------------
					if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint) then
						vim.keymap.set("n", "<leader>uh", function()
							vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }))
						end, { desc = "[T]oggle Inlay [H]ints", buffer = event.buf })
					end
				end,
			})

			----------------------------------
			-- Server configuration
			----------------------------------
			-- Load server configurations from files
			----------------------------------
			-- Every file configuration should have at least these two properties
			--  name -> the server name
			--  config -> the config of the server
			--  we configure servers on seperate files, if we do not want to change the
			--  default behaviour then we can just add to the opts.servers the server name
			local servers = {}
			for _, file in
				ipairs(
					vim.fn.readdir(vim.fn.stdpath("config") .. "/lua/custom/plugins/lsp/servers", [[v:val =~ '\.lua$']])
				)
			do
				local server = require("custom.plugins.lsp.servers." .. file:gsub("%.lua$", ""))
				-- lsp.configure(server.name, server.config)
				servers[server.name] = server.config
			end
			----------------------------------
			-- Add servers automaticlly
			----------------------------------
			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

			require("mason").setup()
			local ensure_installed = vim.tbl_keys(servers or {})
			vim.list_extend(ensure_installed, opts.servers)

			require("mason-tool-installer").setup({ ensure_installed = ensure_installed, auto_update = true })

			-- LSP borders
			local handlers = {
				["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" }),
				["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" }),
			}

			require("mason-lspconfig").setup({
				handlers = {
					function(server_name)
						local server = servers[server_name] or {}
						server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})

						server.handlers = handlers
						require("lspconfig")[server_name].setup(server)
					end,
				},
			})

			local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
			vim.diagnostic.config({
				-- virtual_text = false,
				virtual_text = {
					spacing = 4,
					source = "if_many",
					prefix = "●",
				},
				underline = false,
				virtual_lines = false,
				document_highlight = {
					enabled = true,
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
