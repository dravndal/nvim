-- Install packer

local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
        vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
end

local packer_group = vim.api.nvim_create_augroup('Packer', { clear = true })
vim.api.nvim_create_autocmd('BufWritePost',
        { command = 'source <afile> | PackerCompile', group = packer_group, pattern = 'init.lua' })

require('packer').startup(function(use)
        use 'wbthomason/packer.nvim' -- Package manager
        use 'numToStr/Comment.nvim' -- "gc" to comment visual regions/lines
        -- UI to select things (files, grep results, open buffers...)
        use { 'nvim-telescope/telescope.nvim', requires = { 'nvim-lua/plenary.nvim' } }
        use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
        use { 'nvim-telescope/telescope-file-browser.nvim' }
        use { 'nvim-telescope/telescope-project.nvim' }
        use 'nvim-lualine/lualine.nvim' -- Fancier statusline
        -- Add git related info in the signs columns and popups
        use { 'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' } }
        -- Highlight, edit, and navigate code using a fast incremental parsing library
        use 'nvim-treesitter/nvim-treesitter'
        use 'nvim-treesitter/playground'
        -- Additional textobjects for treesitter
        use 'nvim-treesitter/nvim-treesitter-textobjects'
        use({
            "andrewferrier/textobj-diagnostic.nvim",
            config = function()
                require("textobj-diagnostic").setup()
            end,
        })
        use 'williamboman/mason.nvim'
        use 'williamboman/mason-lspconfig.nvim'
        use { "ellisonleao/gruvbox.nvim" }
        use 'Mofiqul/vscode.nvim'
        use "rebelot/kanagawa.nvim"
        use { 'hrsh7th/nvim-cmp', requires = { 'hrsh7th/cmp-nvim-lsp' } }         -- Autocompletion
        use { 'L3MON4D3/LuaSnip', requires = { 'saadparwaiz1/cmp_luasnip' } }     -- Snippet Engine and Snippet Expansion
        use { 'rafamadriz/friendly-snippets' }
        use {
                "windwp/nvim-autopairs",
                config = function() require("nvim-autopairs").setup {
                        fast_wrap = {},
                } end
        }
        use 'windwp/nvim-ts-autotag'
        use 'neovim/nvim-lspconfig' -- Collection of configurations for built-in LSP client
        use 'kyazdani42/nvim-web-devicons'
        use 'NvChad/nvim-colorizer.lua'
        use 'dravndal/vim-arsync'
        use 'jose-elias-alvarez/null-ls.nvim'
        use({
              "kylechui/nvim-surround",
              tag = "*", -- Use for stability; omit to use `main` branch for the latest features
              config = function()
                  require("nvim-surround").setup({
                      -- Configuration here, or leave empty to use defaults
                  })
                end
        })
        use "lukas-reineke/indent-blankline.nvim"
        use {
            "danymat/neogen",
            config = function()
                require('neogen').setup {}
            end,
            requires = "nvim-treesitter/nvim-treesitter",
            -- Uncomment next line if you want to follow only stable versions
            -- tag = "*"
        }
        use "ray-x/lsp_signature.nvim"
        use 'andymass/vim-matchup'
        use "theprimeagen/harpoon"
        use 'asbjornhaland/telescope-send-to-harpoon.nvim'
        use {'https://gitlab.com/madyanov/svart.nvim'}
        use({
            "glepnir/lspsaga.nvim",
            branch = "main",
            config = function()
                local saga = require("lspsaga")
                saga.init_lsp_saga({
                })
            end,
        })
end)
