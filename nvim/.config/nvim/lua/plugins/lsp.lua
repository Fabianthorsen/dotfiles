-- Servers come from Homebrew (see Brewfile), not mason
local servers = { "lua_ls", "jsonls", "yamlls", "taplo", "bashls", "marksman" }

return {
	"neovim/nvim-lspconfig",
	dependencies = { "saghen/blink.cmp", "b0o/SchemaStore.nvim" },
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		vim.lsp.config("*", {
			capabilities = require("blink.cmp").get_lsp_capabilities(),
		})

		vim.lsp.config("lua_ls", {
			settings = {
				Lua = {
					runtime = { version = "LuaJIT" },
					diagnostics = { globals = { "vim" } },
					workspace = { checkThirdParty = false, library = { vim.env.VIMRUNTIME } },
					telemetry = { enable = false },
				},
			},
		})

		vim.lsp.config("jsonls", {
			settings = { json = { schemas = require("schemastore").json.schemas(), validate = { enable = true } } },
		})

		vim.lsp.config("yamlls", {
			settings = {
				yaml = {
					schemaStore = { enable = false, url = "" }, -- use SchemaStore.nvim instead
					schemas = require("schemastore").yaml.schemas(),
				},
			},
		})

		vim.lsp.enable(servers)

		vim.diagnostic.config({
			severity_sort = true,
			underline = true,
			update_in_insert = false,
			virtual_text = { spacing = 2, prefix = "●" },
			float = { border = "rounded", source = true },
			signs = {
				text = {
					[vim.diagnostic.severity.ERROR] = "",
					[vim.diagnostic.severity.WARN] = "",
					[vim.diagnostic.severity.INFO] = "",
					[vim.diagnostic.severity.HINT] = "󰌵",
				},
			},
		})

		-- 0.11+ already maps grn (rename), gra (code action), grr (references),
		-- gri (implementation), gO (symbols), K (hover) and [d / ]d
		vim.api.nvim_create_autocmd("LspAttach", {
			callback = function(ev)
				local function map(lhs, rhs, desc)
					vim.keymap.set("n", lhs, rhs, { buffer = ev.buf, desc = desc })
				end
				map("gd", vim.lsp.buf.definition, "Go to definition")
				map("gD", vim.lsp.buf.declaration, "Go to declaration")
				map("<leader>cd", vim.diagnostic.open_float, "Line diagnostics")
			end,
		})
	end,
}
