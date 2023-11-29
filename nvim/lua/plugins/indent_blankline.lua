local setup, ibl = pcall(require, "ibl")
if not setup then
	return
end

-- local context_char = "│"
--
-- local char = "┆"
-- local highlight = {
-- 	"CursorColumn",
-- 	"Whitespace",
-- }

ibl.setup({
	exclude = {
		filetypes = { "NvimTree", "help", "markdown" },
	},
})
