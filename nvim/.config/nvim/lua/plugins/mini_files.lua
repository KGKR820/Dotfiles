return {
	'nvim-mini/mini.files',
	version = false,
	opts = {
		mappings = {
			close = '<leader>e',
		},
		windows = {
			max_number = 3,
			preview = true,
			width_focus = 25,
			width_preview = 60,
		}
	},
	config = function(_, opts)
		-- 1. Setup the plugin
		require('mini.files').setup(opts)

		-- 2. Define the action (using logic from the snippet)
		local set_cwd = function()
			local path = (MiniFiles.get_fs_entry() or {}).path
			if path == nil then return vim.notify('Cursor is not on valid entry') end
			vim.fn.chdir(vim.fs.dirname(path))
			-- Optional: Add a notification if you want confirmation
			vim.notify('CWD set to: ' .. vim.fs.dirname(path))
		end

		-- 3. Create the autocommand
		vim.api.nvim_create_autocmd('User', {
			pattern = 'MiniFilesBufferCreate',
			callback = function(args)
				-- Mapped to 'g~' to match snippet (change to 'gc' if preferred)
				vim.keymap.set('n', '<C-c>', set_cwd, { buffer = args.data.buf_id, desc = 'Set cwd' })
			end,
		})
	end
}
