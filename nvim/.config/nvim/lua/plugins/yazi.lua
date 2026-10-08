return {
	"mikavilpas/yazi.nvim",
	version = "*",
	event = "VeryLazy",
	dependencies = { { "nvim-lua/plenary.nvim", lazy = true } },
	keys = {
		{ "-", mode = { "n", "v" }, "<cmd>Yazi<cr>", desc = "Yazi at the current file" },
		{ "<leader>-", "<cmd>Yazi cwd<cr>", desc = "Yazi in the working directory" },
		{ "<leader>fy", "<cmd>Yazi toggle<cr>", desc = "Resume the last yazi session" },
	},
	init = function()
		-- let yazi handle directories instead of netrw
		vim.g.loaded_netrwPlugin = 1
	end,
	opts = {
		open_for_directories = true,
	},
}
