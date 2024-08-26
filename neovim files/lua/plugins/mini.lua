return {
	--plugin with fast and feature-rich surround actions https://github.com/echasnovski/mini.surround
	{
		"echasnovski/mini.surround",
		version = "*",
		config = function()
			require("mini.surround").setup()
		end,
	},
}
