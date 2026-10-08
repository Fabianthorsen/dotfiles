return {
	"saghen/blink.cmp",
	version = "1.*", -- prebuilt fuzzy-matcher binaries
	event = "InsertEnter",
	opts = {
		keymap = { preset = "enter" },
		appearance = { nerd_font_variant = "mono" },
		completion = {
			documentation = { auto_show = true, auto_show_delay_ms = 300 },
		},
		signature = { enabled = true },
	},
}
