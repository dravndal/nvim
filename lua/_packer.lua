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
        use 'tpope/vim-fugitive' -- Git commands in nvim
        use 'numToStr/Comment.nvim' -- "gc" to comment visual regions/lines
        -- UI to select things (files, grep results, open buffers...)
        use { 'nvim-telescope/telescope.nvim', requires = { 'nvim-lua/plenary.nvim' } }
        use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
        use { 'nvim-telescope/telescope-file-browser.nvim' }
        use 'nvim-lualine/lualine.nvim' -- Fancier statusline
        -- Add git related info in the signs columns and popups
        use { 'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' } }
        -- Highlight, edit, and navigate code using a fast incremental parsing library
        use 'nvim-treesitter/nvim-treesitter'
        -- Additional textobjects for treesitter
        use 'nvim-treesitter/nvim-treesitter-textobjects'
        use({
            "andrewferrier/textobj-diagnostic.nvim",
            config = function()
                require("textobj-diagnostic").setup()
            end,
        })
        use 'williamboman/mason.nvim'                                             -- Manage external editor tooling i.e LSP servers
        use 'williamboman/mason-lspconfig.nvim'                                   -- Automatically install language servers to stdpath
        use 'tiagovla/tokyodark.nvim'
        use { 'kartikp10/noctis.nvim', requires = { 'rktjmp/lush.nvim' } }

        use { 'hrsh7th/nvim-cmp', requires = { 'hrsh7th/cmp-nvim-lsp' } }         -- Autocompletion
        use { 'L3MON4D3/LuaSnip', requires = { 'saadparwaiz1/cmp_luasnip' } }     -- Snippet Engine and Snippet Expansion
        use { 'goolord/alpha-nvim', requires = { 'kyazdani42/nvim-web-devicons', 'BlakeJC94/alpha-nvim-fortune' }}

        use {
                "windwp/nvim-autopairs",
                config = function() require("nvim-autopairs").setup {
                        fast_wrap = {},
                } end
        }
        use 'windwp/nvim-ts-autotag'
        use 'neovim/nvim-lspconfig' -- Collection of configurations for built-in LSP client
        use 'onsails/lspkind.nvim'
        use 'kyazdani42/nvim-web-devicons'
        use 'xiyaowong/nvim-transparent'
        use 'NvChad/nvim-colorizer.lua'
        use 'dravndal/vim-arsync' --fork this
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
        -- using packer.nvim
        use { "akinsho/toggleterm.nvim", tag = '*' }
        use { 'kosayoda/nvim-lightbulb', requires = 'antoinemadec/FixCursorHold.nvim' }
        -- using packer.nvim
        use { 'nmac427/guess-indent.nvim', config = function() require('guess-indent').setup {} end, }
        use 'mfussenegger/nvim-dap'
        use { 'theHamsta/nvim-dap-virtual-text', requires = { "mfussenegger/nvim-dap" }, }
        use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} }
        use { "nvim-telescope/telescope-dap.nvim"}
        use({
          "folke/noice.nvim",
          event = "VimEnter",
          config = function()
            require("noice").setup()
          end,
          requires = {
            -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
            "MunifTanjim/nui.nvim",
            "rcarriga/nvim-notify",
          }
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
end)
