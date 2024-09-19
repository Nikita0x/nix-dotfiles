return {
	"chrisgrieser/nvim-recorder",
	dependencies = "rcarriga/nvim-notify", -- optional, but recommended
	event = "VeryLazy", -- load the plugin at startup
	opts = {
		-- Clear keymaps set by the plugin
		clear_keymaps = true,
		-- Customize keymaps
		mapping = {
			startStopRecording = "<F3>",
			playMacro = "<F4>",
			switchSlot = "<C-s>",
			editMacro = "cq",
			yankMacro = "yq",
			addBreakPoint = "##",
		},
		-- Customize slots
		slots = { "a", "b", "c", "d" },
		-- Customize the popup window
		popup = {
			border = "rounded",
			width = "40%",
			height = "60%",
			borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
		},
		-- Customize notifications
		useNotifications = true,
	},
}
