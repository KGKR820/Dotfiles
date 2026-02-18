local opt = vim.opt

opt.number = true
opt.relativenumber = true
opt.wrap = true

-- Border when S-k is pressed on keyword
opt.winborder = "rounded"

-- Auto-indenting and >>/<< commands use 2 spaces
opt.shiftwidth = 2

-- 1 literal Tab character = 2 spaces wide
opt.tabstop = 2

-- Sync Neovim clipboard with your OS
opt.clipboard = "unnamedplus"

opt.smarttab = true
opt.autoindent = true
opt.smartindent = true

-- Remember undo's for files
opt.undofile = true

-- Enable mouse for resizing tabs and windows
opt.mouse = "a"

-- Ignore case-sensitivity while searching via \
opt.ignorecase = true
opt.smartcase = true

-- Extra fro warning and error icons to the left
opt.signcolumn = "yes"

-- Vertical splits open to the right
opt.splitright = true

-- Horizontal splits open below
opt.splitbelow = true

-- Keep 10 lines of context above/below the cursor
opt.scrolloff = 10

-- Smooth Scrolling
opt.smoothscroll = true

-- Briefly flash a highlight over yanked (copied) text
vim.api.nvim_create_autocmd("TextYankPost", {
	group = vim.api.nvim_create_augroup("YankHighlight", { clear = true }),
	pattern = "*",
	callback = function()
		vim.highlight.on_yank()
	end,
	desc = "Highlight yank",
})
