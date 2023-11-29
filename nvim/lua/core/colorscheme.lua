local status, _ = pcall(vim.cmd, "colorscheme nightfox")
if not status then
  print("Colorscheme not found!") -- print error if colorscheme not installed
  return
end

require("nightfox").setup({
	options = {
		styles = {
			comments = "italic",
			keywords = "bold",
			types = "italic,bold",
		},
	},
})
