local glb = vim.g

glb.mapleader = " "
glb.maplocalleader = "\\"

vim.keymap.set("i", "jj", "<ESC>")
vim.keymap.set("n", "<leader>e", "<cmd>lua MiniFiles.open()<cr>", { desc = "Open File Explorer" })

-- Buffer Navigation
vim.keymap.set("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
vim.keymap.set("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next Buffer" })
vim.keymap.set("n", "<leader>bd", "<cmd>bd<cr>", { desc = "Delete current Buffer" })

-- Move to window using the <ctrl> hjkl keys
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Go to Left Window", remap = true })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Go to Lower Window", remap = true })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Go to Upper Window", remap = true })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Go to Right Window", remap = true })

-- Clear search and stop snippet on escape
vim.keymap.set({ "i", "n", "s" }, "<esc>", function()
	vim.cmd("noh")
	return "<esc>"
end, { expr = true, desc = "Escape and Clear hlsearch" })

-- -- Telescope
-- local builtin = require('telescope.builtin')
-- local actions = require('telescope.actions')
-- vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
-- vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
-- vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
-- vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
-- require('telescope').setup {
--     defaults = {
--         mappings = {
--             i = {
--                 ["<c-d>"] = actions.delete_buffer,
--             },
--             n = {
--                 ["<c-d>"] = actions.delete_buffer,
--                 ["dd"] = actions.delete_buffer,
--             },
--         },
--     },
-- }


vim.keymap.set("n", "<leader>i", function()
	local enabled = vim.lsp.inlay_hint.is_enabled({ 0 })
	vim.lsp.inlay_hint.enable(not enabled, { 0 })
	vim.notify("Inlay hints: " .. (enabled and "off" or "on"))
end, { desc = "Toggle LSP Inlay Hints" })
