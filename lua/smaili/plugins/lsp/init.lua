return {
	{ -- LSP
		"neovim/nvim-lspconfig",
		event = "BufReadPost",
		dependencies = {
			{ "williamboman/mason.nvim", opts = {}, run = ":MasonUpdate" }, -- installing LSPs automaticlly
			"williamboman/mason-lspconfig.nvim", -- lsp configuration for mason lsp
			"folke/neodev.nvim", -- extra documentation
			{ "j-hui/fidget.nvim", opts = {} }, -- status for lsp
			"hrsh7th/nvim-cmp",
			{
				"glepnir/lspsaga.nvim",
				opts = {
					code_action = {
						show_server_name = true,
						extend_gitsigns = false,
					},
					lightbulb = {
						enable = false,
					},
					diagnostic = {
						on_insert = false,
						on_insert_follow = false,
					},
					rename = {
						in_select = false,
					},
				},
			},
			-- "rrethy/vim-illuminate",
		},
		opts = {
			diagnostics = {
				update_in_insert = false,
				virtual_text = false,
			},
			autoformat = true,
			servers = {
				"tsserver",
				-- "eslint",
				"html",
				"lua_ls",
				"jsonls",
				"tailwindcss",
				"dockerls",
				"docker_compose_language_service",
				"astro",
				"vimls",
				"cssls",
				"astro",
			},
		},
		config = function(plugin, opts)
			----------------------------------
			-- Diagnostics
			----------------------------------
			for name, icon in pairs(smaili.icons.diagnostics) do
				name = "DiagnosticSign" .. name
				vim.fn.sign_define(name, { text = icon, texthl = name, numhl = "" })
			end
			vim.diagnostic.config(opts.diagnostics)

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
					vim.fn.readdir(vim.fn.stdpath("config") .. "/lua/smaili/plugins/lsp/servers", [[v:val =~ '\.lua$']])
				)
			do
				local server = require("smaili.plugins.lsp.servers." .. file:gsub("%.lua$", ""))
				-- lsp.configure(server.name, server.config)
				servers[server.name] = server.config
			end

			----------------------------------
			-- ON ATTACH
			----------------------------------
			local on_attach = function(client, bufnr)
				----------------------------------
				-- Load key mappings
				----------------------------------
				require("smaili.plugins.lsp.key-mappings")(bufnr)

				-- Highlight lsp reference when we keep hovering -> :h document_highlight
				if client.server_capabilities.documentHighlightProvider then
					vim.api.nvim_create_augroup("lsp_document_highlight", { clear = true })
					vim.api.nvim_clear_autocmds({ buffer = bufnr, group = "lsp_document_highlight" })
					vim.api.nvim_create_autocmd("CursorHold", {
						callback = vim.lsp.buf.document_highlight,
						buffer = bufnr,
						group = "lsp_document_highlight",
						desc = "Document Highlight",
					})
					vim.api.nvim_create_autocmd("CursorMoved", {
						callback = vim.lsp.buf.clear_references,
						buffer = bufnr,
						group = "lsp_document_highlight",
						desc = "Clear All the References",
					})
				end
			end

			----------------------------------
			-- Add servers automaticlly
			----------------------------------
			local capabilities =
				require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

			require("mason-lspconfig").setup({ ensure_installed = opts.servers })
			require("mason-lspconfig").setup_handlers({
				function(server_name)
					local server_opts = servers[server_name] or {}
					server_opts["capabilities"] = capabilities
					server_opts["on_attach"] = on_attach
					require("lspconfig")[server_name].setup(server_opts)
				end,
			})
		end,
	},
	-- ===========================
	-- Autocompletion
	-- ===========================
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			{ "L3MON4D3/LuaSnip", opts = {} }, -- TODO check and fix this for adding friendly snippet
			"saadparwaiz1/cmp_luasnip",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-nvim-lsp-signature-help",
		},
		opts = function()
			local cmp = require("cmp")
			local luasnip = require("luasnip")

			return {
				completion = {
					completeopt = "menu,menuone,noinsert",
				},
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
					end,
				},
				formatting = {
					format = function(_, item)
						item.kind = string.format("%s %s", smaili.icons.lsp[item.kind], item.kind)
						return item
					end,
				},
				sources = cmp.config.sources({
					{ name = "nvim_lsp_signature_help" },
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
					{ name = "buffer" },
					{ name = "path" },
				}),
				mapping = cmp.mapping.preset.insert({
					["<C-k>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
					["<C-j>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
					["<C-d>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete({}),
					["<CR>"] = cmp.mapping.confirm({ select = true }),
					["<Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_next_item()
						elseif luasnip.expand_or_jumpable() then
							luasnip.expand_or_jump()
						else
							fallback()
						end
					end, { "i", "s" }),
					["<S-Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_prev_item()
						elseif luasnip.jumpable(-1) then
							luasnip.jump(-1)
						else
							fallback()
						end
					end, { "i", "s" }),
				}),
			}
		end,
	},
	-- ===========================
	-- Formatter
	-- ===========================
	{
		"jose-elias-alvarez/null-ls.nvim",
		dependencies = {
			"jayp0521/mason-null-ls.nvim",
		},
		event = "BufReadPost",
		config = function()
			----------------------------------
			-- Setting up formatter
			----------------------------------
			require("smaili.plugins.lsp.formatting")
		end,
	},
}
