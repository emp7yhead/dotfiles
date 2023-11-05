local options = {
-- line numbers
    number = true,                           -- set numbered lines
    relativenumber = true,                   -- set relative numbered lines

-- tab & indentation
    expandtab = true,                        -- convert tabs to spaces
    shiftwidth = 2,                          -- the number of spaces inserted for each indentation
    tabstop = 2,                             -- insert 2 spaces for a tab
    autoindent = true,

-- line wrapping
    wrap = true,                             -- display lines as one long line
    linebreak = true,                        -- companion to wrap, don't split words

-- search settings
    ignorecase = true,                       -- ignore case in search patterns
    smartcase = true,                        -- smart case

-- cursor line
    cursorline = true,                       -- highlight the current line

-- appearance
    termguicolors = true,                    -- set term gui colors (most terminals support this)

-- clipboard
    cmdheight = 2,                           -- more space in the neovim command line for displaying messages
    clipboard = "unnamedplus",               -- allows neovim to access the system clipboard

-- split windows
    splitbelow = true,                       -- force all horizontal splits to go below current window
    splitright = true,                       -- force all vertical splits to go to the right of current window

-- other config
    backup = false,                          -- creates a backup file
    completeopt = { "menuone", "noselect" }, -- mostly just for cmp
    conceallevel = 0,                        -- so that `` is visible in markdown files
    fileencoding = "utf-8",                  -- the encoding written to a file
    hlsearch = true,                         -- highlight all matches on previous search pattern
    mouse = "a",                             -- allow the mouse to be used in neovim
    pumheight = 10,                          -- pop up menu height
    showmode = true,                         -- we don't need to see things like -- INSERT -- anymore
    showtabline = 2,                         -- always show tabs
    smartindent = true,                      -- make indenting smarter again
    swapfile = false,                        -- creates a swapfile
    timeoutlen = 300,                        -- time to wait for a mapped sequence to complete (in milliseconds)
    undofile = true,                         -- enable persistent undo
    updatetime = 300,                        -- faster completion (4000ms default)
    writebackup = false,                     -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
    signcolumn = "yes",                      -- always show the sign column, otherwise it would shift the text each time
    scrolloff = 8,                           -- minimal number of screen lines to keep above and below the cursor
    sidescrolloff = 8,                       -- minimal number of screen columns either side of cursor if wrap is `false`
    guifont = { "Martian_Mono", ":h18" },    -- the font used in graphical neovim applications
    eol = true,
  }

  vim.opt.shortmess:append "c"

  for k, v in pairs(options) do
    vim.opt[k] = v
  end
  
  vim.opt.guifont = { "Martian Mono", ":h18" } 

  vim.cmd "set whichwrap+=<,>,[,],h,l"
  vim.cmd [[set iskeyword+=-]]
  
  -- remove trailing whitespace on save
  vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = { "*" },
  command = [[%s/\s\+$//e]],
})
