return function()
	local bufferline = safe_require("bufferline")
	if not bufferline then
		return
	end

	bufferline.setup({
		options = {
			max_name_length = 18,
			max_prefix_length = 15, -- prefix used when a buffer is deduplicated
			tab_size = 18,
			diagnostics = "nvim_lsp",
			offsets = { { filetype = "NvimTree" } },
			show_buffer_close_icons = false,
			show_close_icon = false,
			show_tab_indicators = true,
			persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
			separator_style = "thick",
			always_show_bufferline = true,
		},
	})
end
