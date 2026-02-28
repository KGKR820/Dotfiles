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
        -- Set initial state to false
        local show_hiddenfiles = false
        
        local filter_show = function(fs_entry) return true end
        local filter_hide = function(fs_entry)
            return not vim.startswith(fs_entry.name, '.')
        end

        -- Inject the default filter into opts before setup
        opts.content = opts.content or {}
        opts.content.filter = filter_hide

        -- 1. Setup the plugin
        require('mini.files').setup(opts)

        -- 2. Define the actions
        local set_cwd = function()
            local path = (MiniFiles.get_fs_entry() or {}).path
            if path == nil then return vim.notify('Cursor is not on valid entry') end
            vim.fn.chdir(vim.fs.dirname(path))
            vim.notify('CWD set to: ' .. vim.fs.dirname(path))
        end

        local toggle_hiddenfiles = function()
            show_hiddenfiles = not show_hiddenfiles
            local new_filter = show_hiddenfiles and filter_show or filter_hide
            
            -- Update global config so the state persists across open/close
            MiniFiles.config.content.filter = new_filter
            
            -- Refresh the currently open instance
            MiniFiles.refresh({ content = { filter = new_filter } })
            vim.notify('Hidden Files : ' .. tostring(show_hiddenfiles))
        end

        -- 3. Create the autocommand
        vim.api.nvim_create_autocmd('User', {
            pattern = 'MiniFilesBufferCreate',
            callback = function(args)
                local buf_id = args.data.buf_id
                
                vim.keymap.set('n', '<C-c>', set_cwd, { buffer = buf_id, desc = 'Set cwd' })
                vim.keymap.set('n', 'g.', toggle_hiddenfiles, { buffer = buf_id, desc = 'Toggle Hidden Files' })
            end,
        })
    end
}
