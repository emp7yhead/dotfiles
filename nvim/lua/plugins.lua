local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end

vim.opt.rtp:prepend(lazypath)

local plugins = {
	{ "nvim-lua/popup.nvim" },  -- An implementation of the Popup API from vim in Neovim
	{ "nvim-lua/plenary.nvim" },  -- Useful lua functions used ny lots of plugin
	{ "EdenEast/nightfox.nvim" },  -- Colorscheme
	{ "christoomey/vim-tmux-navigator" },  -- Move betveen tmux and vim
	{ "szw/vim-maximizer" },  -- Maximize vim window
	{
		"akinsho/bufferline.nvim",  -- Tabs for buffers
		requires = "nvim-tree/nvim-web-devicons",
	},
	{ "tpope/vim-surround" },  -- add, delete, change surroundings (it's awesome)
	{ "vim-scripts/ReplaceWithRegister" },  -- replace with register contents using motion (gr + motion)
	{ "numToStr/Comment.nvim", lazy = false },  -- Comment with gc
	{ "nvim-tree/nvim-tree.lua" },  -- File explorer
	{ "nvim-tree/nvim-web-devicons" },  -- Styled icons
	{ "nvim-lualine/lualine.nvim" },  -- Pretty statusline

	-- Fuzzy finding
	{ "nvim-telescope/telescope.nvim", branch = "0.1.x", dependencies = { "nvim-lua/plenary.nvim" } },  -- Better sorting perfomance
	{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" }, -- FF

	-- Autocompletion
	{ "hrsh7th/nvim-cmp" },  -- completion plugin
	{ "hrsh7th/cmp-buffer" },  -- source for text in buffer
	{ "hrsh7th/cmp-path" },   -- source for file system paths

	-- Snippents
	{
		"L3MON4D3/LuaSnip",  -- snippet engine
		version = "v2.*",
		build = "make install_jsregexp",
		dependencies = { "rafamadriz/friendly-snippets" },
	},
	{ "saadparwaiz1/cmp_luasnip", dependencies = { "L3MON4D3/LuaSnip" } },  -- for autocompletion
	{ "rafamadriz/friendly-snippets" },  -- useful snippets

    -- Managing & installing lsp servers, linters & formatters
	{ "williamboman/mason.nvim" },  -- Managing lsp servers, linters & formatters
	{ "williamboman/mason-lspconfig.nvim" },  -- Bridges gap b/w mason & lspconfig

	-- Lsp servers configuration
	{ "neovim/nvim-lspconfig" },  -- Easily configure language servers
	{ "hrsh7th/cmp-nvim-lsp" },  -- Autocompletion
	{
		"glepnir/lspsaga.nvim",  --Enhanced lsp UIs
		branch = "main",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons",
		},
	},
	{ "jose-elias-alvarez/typescript.nvim" },  -- Additional functionality for typescript server (e.g. rename file & update imports)
	{ "onsails/lspkind.nvim" },  -- Vs-code like icons for autocompletion
	{ "folke/lsp-trouble.nvim", requires = "nvim-tree/nvim-web-devicons" },  -- List for showing diagnostics

	-- Formatting & linting
	{ "nvimtools/none-ls.nvim" },  -- LSP diagnostics, code actions
	{
		"jayp0521/mason-null-ls.nvim",  -- bridges gap b/w mason & null-ls
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"williamboman/mason.nvim",
			"nvimtools/none-ls.nvim",
		},
	},

	-- Treesitter configuration
	{
		"nvim-treesitter/nvim-treesitter",  -- Highlighting
		run = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
	},
	{ "nvim-treesitter/nvim-treesitter-context" },  -- Context for functions

	-- Autoclosing
	{ "windwp/nvim-autopairs", event = "InsertEnter" },  -- Autoclosing brackets
	{ "windwp/nvim-ts-autotag", after = "nvim-treesitter" },  -- Autoclosing tags

	--Git
	{ "lewis6991/gitsigns.nvim" },  -- Show line modifications on left hand side
	{ "tpope/vim-fugitive" },  -- Everything for git
	{
        "kdheepak/lazygit.nvim",
        -- optional for floating window border decoration
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
    },

	{ "lukas-reineke/indent-blankline.nvim" }, -- Indentation highlightning
	{ "MunifTanjim/nui.nvim" },  -- UI Component Library
	{ "rcarriga/nvim-notify" },  -- Pretty notifications
	{
		"folke/noice.nvim",  -- More pretty notifications
		event = "VeryLazy",
		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
	},
	{
		"folke/which-key.nvim",  -- Show keybindings
		event = "VeryLazy",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
		end,
	},
}

local opts = {
	keys = "<Leader>",
}

require("lazy").setup(plugins, opts)
