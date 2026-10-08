-- stylua and shfmt come from Homebrew (see Brewfile)
return {
	"stevearc/conform.nvim",
	event = "BufWritePre",
	cmd = "ConformInfo",
	keys = {
		{
			"<leader>cf",
			function()
				require("conform").format({ async = true, lsp_format = "fallback" })
			end,
			desc = "Format buffer",
		},
	},
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			sh = { "shfmt" },
			bash = { "shfmt" },
		},
		-- everything else (json, yaml, toml) falls back to its language server
		format_on_save = { timeout_ms = 1000, lsp_format = "fallback" },
	},
}
