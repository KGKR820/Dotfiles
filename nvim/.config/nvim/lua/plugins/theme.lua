return {
  { 
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000, 
  config = function()
    vim.cmd.colorscheme "catppuccin"
  end
},
{
 "nvim-tree/nvim-web-devicons", 
 opts = {}
},
{
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
		opts ={
			options = {
            globalstatus = true, -- Recommened so you only have one bottom line, not one per split pane
						component_separators = { left = '|', right = '|' },
						section_separators = { left = '', right = '' },
					},
					sections = {
						-- Left side
						lualine_a = {'mode'},
						lualine_b = {'branch', 'diff', 'diagnostics'},
						lualine_c = {
							{
								'buffers',
								mode = 2, -- 0: name, 1: index, 2: name + index, 3: buffer number, 4: name + buffer number
								show_filename_only = true,   -- Shows shortened relative path when set to false
								hide_filename_extension = false,   -- Hide filename extension when set to true
								show_modified_status = true, -- Shows indicator when the buffer is modified

								symbols = {
									modified = ' ●',      -- Text to show when the buffer is modified
									alternate_file = ' ',  -- Text to show to identify the alternate file (left blank to reduce clutter)
									directory =  '',     -- Text to show when the buffer is a directory
								},
							}
						},
						-- Right side
						lualine_x = {'filetype'},
						lualine_y = {'progress'},
						lualine_z = {'location'}
					},
				}
			}
		}	
