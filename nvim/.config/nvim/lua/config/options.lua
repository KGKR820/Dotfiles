-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.opt.wrap = true
vim.g.db = "mariadb://root:820939@localhost:3306/mydb"
vim.api.nvim_create_autocmd("Filetype", {
  pattern = "sql",
  callback = function()
    vim.keymap.del("i", "<left>", { buffer = true })
    vim.keymap.del("i", "<right>", { buffer = true })
  end,
})
vim.opt.scrolloff = 10
vim.keymap.set("i", "jj", "<Esc>")
