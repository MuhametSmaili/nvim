-------------------------------------------------
-- name : lsp-zero
-- url  : https://github.com/nvim-tree/nvim-tree.lua
-------------------------------------------------

local M = {
	"VonHeikemen/lsp-zero.nvim",
	dependencies = {
		-- LSP Support
		"neovim/nvim-lspconfig",
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		-- Autocompletion
		"hrsh7th/nvim-cmp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"saadparwaiz1/cmp_luasnip",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-nvim-lua",
		-- Formatter & linter
		"jose-elias-alvarez/null-ls.nvim",
		"jayp0521/mason-null-ls.nvim",
		-- Snippets
		"L3MON4D3/LuaSnip",
		"rafamadriz/friendly-snippets",
		-- show code context
		"SmiteshP/nvim-navic",
		-- signature help
		"ray-x/lsp_signature.nvim",
	},
	event = "BufReadPost",
}

-- Load configuration of server(s) inside `servers` directory
local function loadServerConfigs(lsp)
	for _, file in
		ipairs(vim.fn.readdir(vim.fn.stdpath("config") .. "/lua/smaili/plugins/lsp/servers", [[v:val =~ '\.lua$']]))
	do
		local server = require("smaili.plugins.lsp.servers." .. file:gsub("%.lua$", ""))
		lsp.configure(server.name, server.config)
	end
end

-- LSP configuration
function M.config()
	local lsp = require("lsp-zero")

	lsp.preset("recommended")

	lsp.ensure_installed({
		"tsserver",
		"eslint",
		"html",
		"sumneko_lua",
		"jsonls",
		"tailwindcss",
	})

	----------------------------------
	-- Mappings
	----------------------------------
	local cmp = require("cmp")
	local cmp_select = { behavior = cmp.SelectBehavior.Select }
	local cmp_mappings = lsp.defaults.cmp_mappings({
		["<C-k>"] = cmp.mapping.select_prev_item(cmp_select),
		["<C-j>"] = cmp.mapping.select_next_item(cmp_select),
		["<C-d>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<Tab>"] = cmp.mapping(function(fallback)
			local luasnip = require("luasnip")
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			else
				fallback()
			end
		end, { "i", "s" }),
		["<C-Space>"] = cmp.mapping.complete({}),
	})

	----------------------------------
	-- Configure servers
	----------------------------------
	loadServerConfigs(lsp)

	----------------------------------
	-- On Attach
	----------------------------------
	lsp.on_attach(function(client, bufnr)
		----------------------------------
		-- Load mappings on attach
		----------------------------------
		require("smaili.plugins.lsp.mappings")(bufnr)

		----------------------------------
		-- Load signature help
		----------------------------------
		require("lsp_signature").on_attach({}, bufnr)

		----------------------------------
		-- Load plugin for showing current code context
		----------------------------------
		local activeServer = client.name
		if activeServer == "tsserver" or activeServer == "sumneko_lua" or activeServer == "jsonls" then
			require("nvim-navic").attach(client, bufnr)
		end
	end)

	----------------------------------
	-- LSP SETUP
	----------------------------------
	-- vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
	-- 	border = "rounded",
	-- 	close_events = { "CursorMoved", "BufHidden", "InsertCharPre" },
	-- })
	lsp.setup()

	----------------------------------
	-- Setting up formatter
	----------------------------------
	require("smaili.plugins.lsp.formatting")

	--icons test
	local diagnosticsIcons = {
		Error = " ",
		Warn = " ",
		Hint = " ",
		Info = " ",
	}
	for name, icon in pairs(diagnosticsIcons) do
		name = "DiagnosticSign" .. name
		vim.fn.sign_define(name, { text = icon, texthl = name, numhl = "" })
	end
	----------------------------------
	-- Add cmp config
	----------------------------------
	local kind_icons = require("smaili.plugins.lsp.icons")
	local cmp_config = lsp.defaults.cmp_config({
		mapping = cmp_mappings,
		window = {
			completion = cmp.config.window.bordered(),
			documentation = cmp.config.window.bordered(),
		},
		formatting = {
			format = function(_, vim_item)
				vim_item.kind = string.format("%s %s", kind_icons[vim_item.kind], vim_item.kind)
				return vim_item
			end,
		},
	})
	cmp.setup(cmp_config)
end

return M
