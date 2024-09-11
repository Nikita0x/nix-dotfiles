require("core.settings")
require("core.keymaps")
require("core.autocmd")
local clear_processes = require("modules.clear-processes")
local generate_editorconfig = require("modules.generate-editorconfig")
 -- JUST ANOTHER TEAST IN VIM
vim.api.nvim_create_user_command("ClearProcesses", function()
	clear_processes.clear_processes()
end, {})

vim.api.nvim_create_user_command("GenerateEditorconfig", function()
	generate_editorconfig.generate_editorconfig()
end, {})

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins", {
	change_detection = {
		enabled = false,
		notify = false,
	},
})

-- Load custom syntax highlighting
require("highlighting.custom_highlights")

-- require'cmp'.setup {
--   sources = {
--     { name = 'nvim_lsp_signature_help' }
--   }
-- }

-- inspect highlighting
vim.api.nvim_set_keymap('n', '<leader>i', ':Inspect<CR>', { noremap = true, silent = true, desc = 'Inspect token' })

-- Alternate between current buffer and alterante buffer
vim.api.nvim_set_keymap('n', '<Tab>', '<C-^>', { noremap = true, silent = true })

-- spectre (global find and replace)
vim.keymap.set('n', '<leader>S', '<cmd>lua require("spectre").toggle()<CR>', {
    desc = "Toggle Spectre"
})
vim.keymap.set('n', '<leader>sw', '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', {
    desc = "Search current word"
})
vim.keymap.set('v', '<leader>sw', '<esc><cmd>lua require("spectre").open_visual()<CR>', {
    desc = "Search current word"
})
vim.keymap.set('n', '<leader>sf', '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>', {
    desc = "Search on current file"
})
