return {
	"ibhagwan/fzf-lua",
	cmd = "FzfLua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	keys = {
		-- == FILES ==
		{ "<leader><space>", "<cmd>FzfLua files<cr>",                                                                   desc = "Find Files (Root Dir)" },
		{ "<leader>ff",      "<cmd>FzfLua files<cr>",                                                                   desc = "Find Files (Root Dir)" },

		-- == RECENT FILES ==
		-- Standard "fr" will now show GLOBAL history always
		{ "<leader>fr",      "<cmd>FzfLua oldfiles<cr>",                                                                desc = "Recent Files" },

		-- == BUFFERS ==
		{ "<leader>,",       "<cmd>FzfLua buffers sort_mru=true sort_lastused=true<cr>",                                desc = "Switch Buffer" },
		{ "<leader>bb",      "<cmd>FzfLua buffers sort_mru=true sort_lastused=true<cr>",                                desc = "Switch Buffer" },

		-- == SEARCH / GREP ==
		{ "<leader>sg",      "<cmd>FzfLua live_grep<cr>",                                                               desc = "Grep (Root Dir)" },
		{ "<leader>/",       "<cmd>FzfLua live_grep<cr>",                                                               desc = "Grep (Root Dir)" },
		{ "<leader>sw",      "<cmd>FzfLua grep_cword<cr>",                                                              desc = "Search Word Under Cursor" },
		{ "<leader>sh",      "<cmd>FzfLua help_tags<cr>",                                                               desc = "Help Pages" },
		{ "<leader>sk",      "<cmd>FzfLua keymaps<cr>",                                                                 desc = "Key Maps" },

		-- == GIT ==
		{ "<leader>gc",      "<cmd>FzfLua git_commits<cr>",                                                             desc = "Git Commits" },
		{ "<leader>gs",      "<cmd>FzfLua git_status<cr>",                                                              desc = "Git Status" },
		{ "<leader>gb",      "<cmd>FzfLua git_branches<cr>",                                                            desc = "Git Branches" },

		-- == LSP ==
		{ "gd",              "<cmd>FzfLua lsp_definitions jump_to_single_result=true ignore_current_line=true<cr>",     desc = "Goto Definition" },
		{ "gr",              "<cmd>FzfLua lsp_references jump_to_single_result=true ignore_current_line=true<cr>",      desc = "References" },
		{ "gI",              "<cmd>FzfLua lsp_implementations jump_to_single_result=true ignore_current_line=true<cr>", desc = "Goto Implementation" },
		{ "gy",              "<cmd>FzfLua lsp_typedefs jump_to_single_result=true ignore_current_line=true<cr>",        desc = "Goto Type Definition" },
		{ "<leader>ca",      "<cmd>FzfLua lsp_code_actions<cr>",                                                        desc = "Code Action" },
		{ "<leader>ss",      "<cmd>FzfLua lsp_document_symbols<cr>",                                                    desc = "Document Symbols" },
		{ "<leader>sS",      "<cmd>FzfLua lsp_workspace_symbols<cr>",                                                   desc = "Workspace Symbols" },
		{ "<leader>xx",      "<cmd>FzfLua diagnostics_document<cr>",                                                    desc = "Document Diagnostics" },
		{ "<leader>xX",      "<cmd>FzfLua diagnostics_workspace<cr>",                                                   desc = "Workspace Diagnostics" },
	},
	opts = {
		winopts = {
			height = 0.85,
			width = 0.85,
			row = 0.5,
			col = 0.5,
			border = "rounded",
			preview = {
				layout = "horizontal",
				horizontal = "right:60%",
				scrollbar = false,
			},
		},
		fzf_opts = {
			["--layout"] = "reverse",
			["--info"] = "inline",
		},
		files = {
			prompt = "Files  ",
			formatter = "path.filename_first",
			git_icons = true,
			cwd_prompt = false,
			cwd_header = false,
		},
		oldfiles = {
			prompt = "History  ",
			formatter = "path.filename_first",
			cwd_prompt = false,
			cwd_header = false,
			cwd_only = false,
		},
		grep = {
			prompt = "Grep  ",
			input_prompt = "Grep For  ",
			formatter = "path.filename_first",
			cwd_prompt = false,
		},
		ui_select = function(fzf_opts, items)
			return vim.tbl_deep_extend("force", fzf_opts, {
				prompt = " ",
				winopts = {
					title = " " .. vim.trim((fzf_opts.prompt or "Select"):gsub("%s*:%s*$", "")) .. " ",
					title_pos = "center",
				},
			}, {
				winopts = {
					width = 0.5,
					height = 0.4,
					row = 0.4,
					col = 0.5,
				},
			})
		end,
	},
	config = function(_, opts)
		local fzf = require("fzf-lua")
		fzf.setup(opts)
		fzf.register_ui_select(opts.ui_select or nil)
	end,
}
