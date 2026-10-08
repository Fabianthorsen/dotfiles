return {
	"stevearc/oil.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	lazy = false,
	keys = {
		{ "-", "<cmd>Oil<cr>", desc = "Open parent directory" },
	},
	opts = {
		default_file_explorer = true,
		view_options = { show_hidden = true },
		keymaps = {
			-- leave C-h/C-l to vim-tmux-navigator
			["<C-h>"] = false,
			["<C-l>"] = false,
			["q"] = "actions.close",
		},
	},
}
