return {
    {
        "stevearc/conform.nvim",
        -- event = 'BufWritePre', -- uncomment for format on save
        opts = require "configs.conform",
    },

    -- These are some examples, uncomment them if you want to see them work!
    {
        "neovim/nvim-lspconfig",
        config = function()
            require "configs.lspconfig"
        end,
    },

    {
        "nvim-treesitter/nvim-treesitter",
        opts = {
            ensure_installed = {
                "vim", "lua", "vimdoc", "html", "css", "markdown", "javascript", "c", "tsx"
            },
            highlight = { enable = true },
            indent = { enable = true }
        },
    },
    {
        "kawre/leetcode.nvim",
        build = ":TSUpdate html",
        dependencies = {
            "nvim-telescope/telescope.nvim",
            "nvim-lua/plenary.nvim", -- required by telescope
            "MunifTanjim/nui.nvim",

            -- optional
            "nvim-treesitter/nvim-treesitter",
            "rcarriga/nvim-notify",
            "nvim-tree/nvim-web-devicons",
        },
        opts = {
            lang = "python3"
        },
    },
    {
        "rcarriga/nvim-notify",
        config = function()
            require("notify").setup({
                background_colour = "#000000",
            })
        end
    },
    {
        "lervag/vimtex",
        lazy = false,
        init = function()
            vim.g['vimtex_view_method'] = 'general'
            vim.g['vimtex_quickfix_mode'] = 0 -- suppress error reporting on save and build
            vim.g['tex_conceal'] = 'mgs'
            vim.g['vimtex_matchparen_enabled'] = 0
            vim.g['vimtex_delim_stopline'] = 1
            vim.o.conceallevel = 2
            vim.g['vimtex_log_ignore'] = ({ -- Error suppression:
                'Underfull',
                'Overfull',
                'specifier changed to',
                'Token not allowed in a PDF string',
            })
        end,
    },
    {
        "sirver/ultisnips",
        config = function()
            vim.g['UltiSnipsExpandTrigger'] = '<tab>'
            vim.g['UltiSnipsJumpForwardTrigger'] = '<tab>'
            vim.g['UltiSnipsJumpBackwardTrigger'] = '<s-tab>'
        end
    }

}
