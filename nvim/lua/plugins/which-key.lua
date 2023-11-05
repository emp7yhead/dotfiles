local status, which_key = pcall(require, "which-key")
if not status then
  return
end

which_key.setup {
    window = {
        border = { '', '▔', '', '', '', ' ', '', '' },
        margin = { 0, 0, 1, 0 },
        padding = { 0, 0, 0, 0 },
    },
}
vim.cmd 'set timeoutlen =1000'
