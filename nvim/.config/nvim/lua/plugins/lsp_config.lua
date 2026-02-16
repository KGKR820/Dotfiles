return {
	{
		"mason-org/mason-lspconfig.nvim",
		opts = {},
		dependencies = {
			{ "mason-org/mason.nvim", opts = {} },
			{
				"neovim/nvim-lspconfig",
				config = function()
					-- 1. replicate LazyVim's icons manually
					local icons = {
						Error = " ",
						Warn  = " ",
						Hint  = " ",
						Info  = " ",
					}

					-- 2. Apply the diagnostic configuration
					vim.diagnostic.config({
						underline = true,
						update_in_insert = false,
						virtual_text = {
							spacing = 4,
							source = "if_many",
							prefix = "●",
						},
						severity_sort = true,
						signs = {
							text = {
								[vim.diagnostic.severity.ERROR] = icons.Error,
								[vim.diagnostic.severity.WARN]  = icons.Warn,
								[vim.diagnostic.severity.HINT]  = icons.Hint,
								[vim.diagnostic.severity.INFO]  = icons.Info,
							},
						},
					})
				end
			}
		}
	}
}
