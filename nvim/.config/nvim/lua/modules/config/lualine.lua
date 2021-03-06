local lualine = safe_require('lualine')
if not lualine then
    return
end

lualine.setup({
    options = {
        icons_enabled = false,
        theme = 'auto',
        component_separators = { left = '|', right = '|' },
        section_separators = { left = '', right = '' },
        disabled_filetypes = {},
        always_divide_middle = true,
        -- REQUIRES neovim >=0.7
        globalstatus = false,
    },
    sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch', 'diff', 'diagnostics' },
        lualine_c = {
            {
                'filename',
                file_status = false,
                path = 0, -- 0: filename only, 1: relative, 2: absolute
                shorting_target = 40, -- Shortens path to leave 40 spaces in the window
                symbols = {
                    modified = '[+]', -- Text to show when the file is modified.
                    readonly = '[-]', -- Text to show when the file is non-modifiable or readonly.
                    unnamed = '[No Name]', -- Text to show for unnamed buffers.,
                },
            },
        },
        lualine_x = { 'filetype' },
        lualine_y = {},
        lualine_z = { 'location', 'progress' },
    },
    tabline = {},
    extensions = {},
})
