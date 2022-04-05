return function()
    local nvim_treesitter = safe_require('nvim-treesitter.configs')
    if not nvim_treesitter then
        return
    end

    nvim_treesitter.setup({
        ensure_installed = 'maintained',
        highlight = {
            enable = true, -- false will disable the whole extension
            -- disable = { 'json' }, -- list of language that will be disabled
        },
        indent = { enable = true },
        autopairs = { enable = true },
        rainbow = { enable = true },
        autotag = { enable = true },
        context_commentstring = { enable = true },
    })
end
