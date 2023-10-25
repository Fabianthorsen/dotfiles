return {
  "ThePrimeagen/harpoon",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    local keymap = vim.keymap
    local ui = require("harpoon.ui")
    local mark = require("harpoon.mark")

    keymap.set("n", "<leader>a", mark.add_file)
    keymap.set("n", "<C-e>", ui.toggle_quick_menu)

    keymap.set("n", "<C-h>", function() ui.nav_file(1) end)
    keymap.set("n", "<C-t>", function() ui.nav_file(2) end)
    keymap.set("n", "<C-n>", function() ui.nav_file(3) end)
    keymap.set("n", "<C-s>", function() ui.nav_file(4) end)
  end,
}
