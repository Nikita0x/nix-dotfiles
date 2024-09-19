local keymap = function(mode, lhs, rhs, opts)
	opts = opts or {}
	opts.silent = opts.silent ~= false

	vim.keymap.set(mode, lhs, rhs, opts)
end

keymap("t", "<esc><esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
keymap("n", "<esc>", "<cmd>nohlsearch<cr>")
keymap("i", "jj", "<esc>")

-- better up/down
keymap({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
keymap({ "n", "x" }, "<Down>", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
keymap({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })
keymap({ "n", "x" }, "<Up>", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })

-- Move to window using the <ctrl> hjkl keys
-- keymap("n", "<C-h>", "<C-w>h", { desc = "Go to Left Window", remap = true })
-- keymap("n", "<C-j>", "<C-w>j", { desc = "Go to Lower Window", remap = true })
-- keymap("n", "<C-k>", "<C-w>k", { desc = "Go to Upper Window", remap = true })
-- keymap("n", "<C-l>", "<C-w>l", { desc = "Go to Right Window", remap = true })

-- Resize window using <ctrl> arrow keys
keymap("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
keymap("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
keymap("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })
keymap("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })

-- Move Lines
keymap("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move Down" })
keymap("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move Up" })
keymap("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move Down" })
keymap("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move Up" })
keymap("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move Down" })
keymap("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move Up" })

keymap("n", "<leader>w", "<cmd>update<cr>", { desc = "Save file" })

-- keymap("n", "J", "mzJ`z", { desc = "Join line with next" })

keymap("n", "x", '"_x', { desc = "Delete without copy to clipboard" })
keymap("x", "p", '"_dP', { desc = "Paste without copy to clipboard" })

-- Autocenter
keymap("n", "<C-d>", "<C-d>zz", { desc = "Autocenter on scroll down" })
keymap("n", "<C-u>", "<C-u>zz", { desc = "Autocenter on scroll up" })
keymap("n", "<n>", "nzzzv", { desc = "Autocenter on search forward" })
keymap("n", "<N>", "Nzzzv", { desc = "Autocenter on search backward" })

-- Disable arrow keys :)
-- keymap({ "n", "i" }, "<left>", "")
-- keymap({ "n", "i" }, "<right>", "")
-- keymap({ "n", "i" }, "<up>", "")
-- keymap({ "n", "i" }, "<down>", "")

-- Remap Alt+h to go to the previous buffer
keymap("n", "<A-h>", ":bprevious<CR>", { noremap = true, silent = true })

-- Remap Alt+l to go to the next buffer
keymap("n", "<A-l>", ":bnext<CR>", { noremap = true, silent = true })
-- Remap Left Arrow to go to the previous buffer
keymap("n", "<A-Left>", ":bprevious<CR>", { noremap = true, silent = true })
-- Remap Right Arrow to go to the next buffer
keymap("n", "<A-Right>", ":bnext<CR>", { noremap = true, silent = true })

-- Remap Ctrl+w to close the current buffer
keymap("n", "<C-w>", ":bd<CR>", { noremap = true, silent = true })

-- Remap F1 to rename a symbol using LSP
keymap("n", "<F1>", ":lua vim.lsp.buf.rename()<CR>", { noremap = true, silent = true })

-- Override the default 'm' key to mark the current file with Harpoon
keymap("n", "m", ":lua require('harpoon.mark').add_file()<CR>", { noremap = true, silent = true })

-- Override the default '`' (backtick) key to open the Harpoon menu
keymap("n", "`", ":lua require('harpoon.ui').toggle_quick_menu()<CR>", { noremap = true, silent = true })

-- Keybindings to navigate to marked files
keymap("n", "<leader>h1", ":lua require('harpoon.ui').nav_file(1)<CR>", { noremap = true, silent = true }) -- Go to first marked file
keymap("n", "<leader>h2", ":lua require('harpoon.ui').nav_file(2)<CR>", { noremap = true, silent = true }) -- Go to second marked file
keymap("n", "<leader>h3", ":lua require('harpoon.ui').nav_file(3)<CR>", { noremap = true, silent = true }) -- Go to third marked file
keymap("n", "<leader>h4", ":lua require('harpoon.ui').nav_file(4)<CR>", { noremap = true, silent = true }) -- Go to fourth marked file

-- Keybinding to remove the current file from Harpoon
keymap("n", "<leader>hr", ":lua require('harpoon.mark').rm_file()<CR>", { noremap = true, silent = true })

-- Remove all files from Harpoon
keymap("n", "<leader>hclr", ":lua require('harpoon.mark').clear_all()<CR>", { noremap = true, silent = true })

-- Remap gcc to <leader>c in normal mode
vim.api.nvim_set_keymap("n", "<leader>c", "gcc", { noremap = false, silent = true })

-- Remap gc in visual mode to <leader>c
vim.api.nvim_set_keymap("v", "<leader>c", "gc", { noremap = false, silent = true })

-- Move to the end of the line
vim.api.nvim_set_keymap("n", "L", "$", { noremap = true, silent = true })

-- Move to the start of the line
vim.api.nvim_set_keymap("n", "H", "^", { noremap = true, silent = true })

-- Instant indent and de-indent in Normal and Visual modes
vim.api.nvim_set_keymap("n", ">", ">>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<", "<<", { noremap = true, silent = true })

vim.api.nvim_set_keymap("x", ">", ">gv", { noremap = true })
vim.api.nvim_set_keymap("x", "<", "<gv", { noremap = true })

-- Extend visual selection downwards line by line
vim.api.nvim_set_keymap("v", "V", "j", { noremap = true, silent = true })

-- Map F5 to yank selected text to register 'a' and show a message
vim.api.nvim_set_keymap(
	"n",
	"<F5>",
	[[:let @a = getline("'<", "'>")<CR>:echo "Yanked to register a!"<CR>]],
	{ noremap = true, silent = true }
)
vim.api.nvim_set_keymap("v", "<F5>", [["ay:echo "Yanked to register a!"<CR>]], { noremap = true, silent = true })

-- Map F6 to paste from register 'a' and show a message
vim.api.nvim_set_keymap("n", "<F6>", [["ap:echo "Pasted from register a!"<CR>]], { noremap = true, silent = true })

-- Remap Tab for completion menu navigation
vim.api.nvim_set_keymap("i", "<Tab>", [[pumvisible() ? "\<C-n>" : "\<Tab>"]], { expr = true, noremap = true })

-- Remap Shift-Tab for reverse navigation
vim.api.nvim_set_keymap("i", "<S-Tab>", [[pumvisible() ? "\<C-p>" : "\<S-Tab>"]], { expr = true, noremap = true })
