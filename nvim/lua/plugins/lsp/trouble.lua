require("trouble").setup({
	padding = true,
	height = 11,
	position = "bottom",
	use_diagnostic_signs = true,
	signs = {
		-- icons / text used for a diagnostic
		error = "",
		warning = "",
		hint = "",
		information = "",
		other = "﫠",
	},
	auto_preview = false,
})

vim.api.nvim_create_autocmd({ "BufEnter" }, {
	command = "TroubleRefresh",
})
