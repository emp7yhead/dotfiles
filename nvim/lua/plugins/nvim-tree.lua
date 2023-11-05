-- import nvim-tree plugin safely
local setup, nvimtree = pcall(require, "nvim-tree")
if not setup then
  return
end

-- recommended settings from nvim-tree documentation
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.termguicolors = true
-- change color for arrows in tree to light blue
vim.cmd([[ highlight NvimTreeIndentMarker guifg=#3FC5FF ]])

-- configure nvim-tree
nvimtree.setup({
  -- change folder arrow icons
  renderer = {
    indent_width = 2,
    indent_markers = {
      enable = true,
      inline_arrows = true,
      icons = { corner = '╰' },
    },
    icons = {
      git_placement = 'after',
      modified_placement = 'after',
      padding = ' ',
      glyphs = {
        default = '󰈔',
        folder = {
          arrow_closed = '',
          arrow_open = '',
          default = ' ',
          open = ' ',
          empty = ' ',
          empty_open = ' ',
          symlink = '󰉒 ',
          symlink_open = '󰉒 ',
        },
        git = {
          deleted = '',
          unstaged = '',
          untracked = '',
          staged = '',
          unmerged = '',
        },
      },
    },
  },
  -- disable window_picker for
  -- explorer to work well with
  -- window splits
  actions = {
    open_file = {
      window_picker = {
        enable = false,
      },
    },
  },
  git = { ignore = false },
  diagnostics = { enable = true },
  hijack_cursor = true,
  sync_root_with_cwd = true,
})
