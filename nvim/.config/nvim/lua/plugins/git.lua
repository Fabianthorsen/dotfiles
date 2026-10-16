return {
	{
		"NeogitOrg/neogit",
		cmd = "Neogit",
		dependencies = { "nvim-lua/plenary.nvim", "sindrets/diffview.nvim" },
		keys = {
			{ "<leader>gg", "<cmd>Neogit<cr>", desc = "Neogit" },
		},
		opts = {
			integrations = { diffview = true },
		},
	},
	{
		"sindrets/diffview.nvim",
		cmd = { "DiffviewOpen", "DiffviewFileHistory" },
		opts = function()
			local close = { "n", "q", "<cmd>DiffviewClose<cr>", { desc = "Close Diffview" } }
			return {
				keymaps = {
					view = { close },
					file_panel = { close },
					file_history_panel = { close },
				},
			}
		end,
		keys = {
			{ "<leader>gd", "<cmd>DiffviewOpen<cr>", desc = "Diffview" },
			{ "<leader>gh", "<cmd>DiffviewFileHistory %<cr>", desc = "File history" },
		},
	},
}
