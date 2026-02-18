local glb = vim.g
local map = vim.keymap.set

glb.mapleader = " "
glb.maplocalleader = "\\"

map("i", "jj", "<ESC>")
map("n", "<leader>e", "<cmd>lua MiniFiles.open()<cr>", { desc = "Open File Explorer" })

-- Buffer Navigation
map("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
map("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next Buffer" })
map("n", "<leader>bd", "<cmd>bd<cr>", { desc = "Delete current Buffer" })

-- Move to window using the <ctrl> hjkl keys
map("n", "<C-h>", "<C-w>h", { desc = "Go to Left Window", remap = true })
map("n", "<C-j>", "<C-w>j", { desc = "Go to Lower Window", remap = true })
map("n", "<C-k>", "<C-w>k", { desc = "Go to Upper Window", remap = true })
map("n", "<C-l>", "<C-w>l", { desc = "Go to Right Window", remap = true })

-- Clear search and stop snippet on escape
map({ "i", "n", "s" }, "<esc>", function()
	vim.cmd("noh")
	return "<esc>"
end, { expr = true, desc = "Escape and Clear hlsearch" })

-- Inaly Hints Shortcut
map("n", "<leader>i", function()
	local enabled = vim.lsp.inlay_hint.is_enabled({ 0 })
	vim.lsp.inlay_hint.enable(not enabled, { 0 })
	vim.notify("Inlay hints: " .. (enabled and "off" or "on"))
end, { desc = "Toggle LSP Inlay Hints" })
