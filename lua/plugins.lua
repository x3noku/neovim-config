local ensure_packer = function()
    local path = '~/.local/share/nvim/site/pack/packer/start/packer.nvim'

    if vim.fn.empty(vim.fn.glob(path)) > 0 then
        vim.fn.system({
            'git',
            'clone',
            '--depth',
            '1',
            'https://github.com/wbthomason/packer.nvim',
            path
        })
        vim.cmd [[packadd packer.nvim]]

        return true
    end

    return false
end

local packer_bootstrap = ensure_packer()



return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'


    -- lsp
    use 'williamboman/mason.nvim'
    use 'williamboman/mason-lspconfig.nvim'
    use 'neovim/nvim-lspconfig'
    use 'lervag/vimtex'
    use { 'akinsho/flutter-tools.nvim', requires = { 'nvim-lua/plenary.nvim', 'stevearc/dressing.nvim' } }


    -- autocomplete
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/nvim-cmp'
    use 'onsails/lspkind.nvim'


    -- linting and formatting
    use 'jose-elias-alvarez/null-ls.nvim'


    -- snippets
    use 'SirVer/ultisnips'
    use 'quangnguyen30192/cmp-nvim-ultisnips'
    use 'reconquest/vim-pythonx' -- easier funcitons for snippets


    -- git
    use 'kdheepak/lazygit.nvim' -- lazygit
    use 'lewis6991/gitsigns.nvim' -- git lines statuses


    -- ui extensions
    use 'nvim-tree/nvim-web-devicons' -- icons
    use 'MunifTanjim/nui.nvim' -- ui kit used for neotree
    use 'karb94/neoscroll.nvim' -- smooth scrolling
    use 'stevearc/dressing.nvim' -- ui kit for default vim inputs
    use 'rcarriga/nvim-notify' -- pretty notifications
    use 'nvim-treesitter/nvim-treesitter' -- syntax highlighting
    use 'p00f/nvim-ts-rainbow' -- bracket colorizer
    use { 'folke/todo-comments.nvim', requires = 'nvim-lua/plenary.nvim' } -- todo highlighting
    use 'Yggdroot/indentLine' -- indent lines
    use { 'barrett-ruth/import-cost.nvim', run = 'sh install.sh yarn' }


    -- ui blocks
    use { 'akinsho/bufferline.nvim', tag = "v3.*", requires = 'nvim-tree/nvim-web-devicons' } -- tabs
    use 'nvim-lualine/lualine.nvim' -- status line
    use 'voldikss/vim-floaterm' -- built-in terminal
    use 'folke/which-key.nvim' -- keymap checker
    use { 'nvim-telescope/telescope.nvim', tag = '0.1.1', requires = 'nvim-lua/plenary.nvim' } -- fuzzy
    use { 'folke/trouble.nvim', requires = 'nvim-tree/nvim-web-devicons' } -- pretty list of diagnostics
    use{ 'utilyre/barbecue.nvim', tag = '*', requires = 'SmiteshP/nvim-navic' }
    use { 'SmiteshP/nvim-navic', requires = 'neovim/nvim-lspconfig' } -- current code context
    use { -- file tree
        'nvim-neo-tree/neo-tree.nvim',
        branch = 'v2.x',
        requires = {
            'nvim-lua/plenary.nvim',
            'nvim-tree/nvim-web-devicons',
            'MunifTanjim/nui.nvim',
        },
    }


    -- utils dependencies
    use 'nvim-lua/plenary.nvim' -- lua functions used for neotree, to-dos, fuzzy
    use 'sharkdp/fd' -- finder in files used for fuzzy
    use 'kevinhwang91/promise-async' -- promises


    -- utils
    use 'windwp/nvim-autopairs' -- auto close pairs
    use 'tpope/vim-surround' -- surrounds
    use 'numToStr/Comment.nvim' -- commentaries
    use 'Darazaki/indent-o-matic' -- automatic indents
    use 'windwp/nvim-ts-autotag' -- auto replace tags
    use 'JoosepAlviste/nvim-ts-context-commentstring' -- commentary support for different languages
    use 'tpope/vim-repeat' -- dot support for plugins
    use 'famiu/bufdelete.nvim' -- better buffer closing
    use 'andweeb/presence.nvim' -- discord status plugin
    use { 'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async' }


    -- color schemes
    use { 'catppuccin/nvim', as = 'catppuccin' }
	use 'thedenisnikulin/vim-cyberpunk'
	use 'sainnhe/sonokai'
    use 'hachy/eva01.vim'
    use 'rebelot/kanagawa.nvim'
    use 'lunarvim/horizon.nvim'
    use 'rose-pine/neovim'
    use 'lifepillar/vim-solarized8'
    use { 'embark-theme/vim', as = 'embark' }
    use 'aktersnurra/no-clown-fiesta.nvim'
    use 'justinsgithub/oh-my-monokai.nvim'


    -- Automatically set up your configuration after cloning packer.nvim
    if packer_bootstrap then
        require('packer').sync()
    end
end)
