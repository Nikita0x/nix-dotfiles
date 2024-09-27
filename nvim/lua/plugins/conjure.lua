-- return { "Olical/conjure" }

-- Add Conjure plugin
return {
	"Olical/conjure",
	config = function()
		-- Set the <leader>e key mapping to evaluate the current expression
		vim.api.nvim_set_keymap("n", "<leader>e", ":ConjureEval<CR>", { noremap = true, silent = true })
	end,
}
