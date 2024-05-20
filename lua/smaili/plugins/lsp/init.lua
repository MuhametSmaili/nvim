return {
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		dependencies = {
			"folke/neodev.nvim",
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",

			{ "j-hui/fidget.nvim", opts = {} },

			-- Autoformatting
			"stevearc/conform.nvim",

			-- Schema information
			"b0o/SchemaStore.nvim",

			"rrethy/vim-illuminate",
		},
		config = function()
			require("neodev").setup({
				-- library = {
				--   plugins = { "nvim-dap-ui" },
				--   types = true,
				-- },
			})

			local capabilities = nil
			if pcall(require, "cmp_nvim_lsp") then
				capabilities = require("cmp_nvim_lsp").default_capabilities()
			end

			local lspconfig = require("lspconfig")

			local servers = {
				bashls = true,
				gopls = true,
				lua_ls = true,
				rust_analyzer = true,
				svelte = true,
				templ = true,
				cssls = true,

				-- Probably want to disable formatting for this lang server
				tsserver = true,

				jsonls = {
					settings = {
						json = {
							schemas = require("schemastore").json.schemas(),
							validate = { enable = true },
						},
					},
				},

				yamlls = {
					settings = {
						yaml = {
							schemaStore = {
								enable = false,
								url = "",
							},
							schemas = require("schemastore").yaml.schemas(),
						},
					},
				},

				ocamllsp = {
					manual_install = true,
					settings = {
						codelens = { enable = true },
					},

					filetypes = {
						"ocaml",
						"ocaml.interface",
						"ocaml.menhir",
						"ocaml.cram",
					},

					-- TODO: Check if i still need the filtypes stuff i had before
				},
			}

			local servers_to_install = vim.tbl_filter(function(key)
				local t = servers[key]
				if type(t) == "table" then
					return not t.manual_install
				else
					return t
				end
			end, vim.tbl_keys(servers))

			require("mason").setup()
			local ensure_installed = {
				"stylua",
				"lua_ls",
				"delve",
				-- "tailwind-language-server",
			}

			vim.list_extend(ensure_installed, servers_to_install)
			require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

			for name, config in pairs(servers) do
				if config == true then
					config = {}
				end
				config = vim.tbl_deep_extend("force", {}, {
					capabilities = capabilities,
				}, config)

				lspconfig[name].setup(config)
			end

			local disable_semantic_tokens = {
				lua = true,
			}

			vim.api.nvim_create_autocmd("LspAttach", {
				callback = function(args)
					local bufnr = args.buf
					local client = assert(vim.lsp.get_client_by_id(args.data.client_id), "must have valid client")

					vim.opt_local.omnifunc = "v:lua.vim.lsp.omnifunc"
					vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = 0 })
					vim.keymap.set("n", "gr", vim.lsp.buf.references, { buffer = 0 })
					vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { buffer = 0 })
					vim.keymap.set("n", "gT", vim.lsp.buf.type_definition, { buffer = 0 })
					vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = 0 })

					vim.keymap.set("n", "<space>cr", vim.lsp.buf.rename, { buffer = 0 })
					vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, { buffer = 0 })

					local filetype = vim.bo[bufnr].filetype
					if disable_semantic_tokens[filetype] then
						client.server_capabilities.semanticTokensProvider = nil
					end
				end,
			})

			-- Autoformatting Setup
			require("conform").setup({
				formatters_by_ft = {
					lua = { "stylua" },
				},
			})

			vim.api.nvim_create_autocmd("BufWritePre", {
				callback = function(args)
					require("conform").format({
						bufnr = args.buf,
						lsp_fallback = true,
						quiet = true,
					})
				end,
			})
		end,
	},
}

-- return {
-- 	{
-- 		--LSP
-- 		"neovim/nvim-lspconfig",
-- 		event = "BufReadPost",
-- 		dependencies = {
-- 			{ "williamboman/mason.nvim", opts = {}, run = ":MasonUpdate" }, -- installing LSPs automaticlly
-- 			"williamboman/mason-lspconfig.nvim", -- lsp configuration for mason lsp
-- 			"hrsh7th/nvim-cmp",
-- 			-- { "j-hui/fidget.nvim", opts = {} },
-- 			{
-- 				"glepnir/lspsaga.nvim",
-- 				opts = {
-- 					code_action = {
-- 						show_server_name = true,
-- 						extend_gitsigns = false,
-- 					},
-- 					lightbulb = {
-- 						enable = false,
-- 					},
-- 					diagnostic = {
-- 						on_insert = false,
-- 						on_insert_follow = false,
-- 					},
-- 					rename = {
-- 						in_select = false,
-- 					},
-- 				},
-- 			},
-- 			"rrethy/vim-illuminate",
-- 		},
-- 		opts = {
-- 			diagnostics = {
-- 				update_in_insert = false,
-- 				virtual_text = false,
-- 			},
-- 			autoformat = true,
-- 			servers = {
-- 				"tsserver",
-- 				"html",
-- 				"lua_ls",
-- 				"jsonls",
-- 				"tailwindcss",
-- 				"dockerls",
-- 				"docker_compose_language_service",
-- 				"astro",
-- 				"vimls",
-- 				"cssls",
-- 				"astro",
-- 			},
-- 		},
-- 		config = function(plugin, opts)
-- 			----------------------------------
-- 			-- Diagnostics
-- 			----------------------------------
-- 			for name, icon in pairs(smaili.icons.diagnostics) do
-- 				name = "DiagnosticSign" .. name
-- 				vim.diagnostic.config(name, { text = icon, texthl = name, numhl = "" })
-- 			end
-- 			vim.diagnostic.config(opts.diagnostics)
--
-- 			----------------------------------
-- 			-- Server configuration
-- 			----------------------------------
-- 			-- Load server configurations from files
-- 			----------------------------------
-- 			-- Every file configuration should have at least these two properties
-- 			--  name -> the server name
-- 			--  config -> the config of the server
-- 			--  we configure servers on seperate files, if we do not want to change the
-- 			--  default behaviour then we can just add to the opts.servers the server name
-- 			local servers = {}
-- 			for _, file in
-- 				ipairs(
-- 					vim.fn.readdir(vim.fn.stdpath("config") .. "/lua/smaili/plugins/lsp/servers", [[v:val =~ '\.lua$']])
-- 				)
-- 			do
-- 				local server = require("smaili.plugins.lsp.servers." .. file:gsub("%.lua$", ""))
-- 				-- lsp.configure(server.name, server.config)
-- 				servers[server.name] = server.config
-- 			end
--
-- 			----------------------------------
-- 			-- ON ATTACH
-- 			----------------------------------
-- 			local on_attach = function(client, bufnr)
-- 				----------------------------------
-- 				-- Load key mappings
-- 				----------------------------------
-- 				require("smaili.plugins.lsp.key-mappings")(bufnr)
-- 			end
--
-- 			----------------------------------
-- 			-- Add servers automaticlly
-- 			----------------------------------
-- 			local capabilities = nil
-- 			if pcall(require, "cmp_nvim_lsp") then
-- 				capabilities = require("cmp_nvim_lsp").default_capabilities()
-- 			end
--
-- 			-- local capabilities =
-- 			--   require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
--
-- 			require("mason-lspconfig").setup({ ensure_installed = opts.servers })
-- 			require("mason-lspconfig").setup_handlers({
-- 				function(server_name)
-- 					local server_opts = servers[server_name] or {}
-- 					server_opts["capabilities"] = capabilities
-- 					server_opts["on_attach"] = on_attach
-- 				end,
-- 			})
-- 			return {}
-- 		end,
-- 	},
-- }
