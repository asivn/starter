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
    },
    {
        "GCBallesteros/jupytext.nvim",
        config = function()
            require("jupytext").setup({
                style = "markdown",
                output_extension = "md",
                force_ft = "markdown",
            })
        end
    },
    {
        'benlubas/molten-nvim',
        version = "^1.0.0", -- use version <2.0.0 to avoid breaking changes
        build = ':UpdateRemotePlugins',
        init = function()
            -- Key mappings for molten-nvim
            -- a keybind for `:noautocmd MoltenEnterOutput` to open the output again
            -- vim.g.molten_auto_open_output = false

            -- optional, I like wrapping. works for virt text and the output window
            vim.g.molten_wrap_output = true

            -- be buggy with longer images
            vim.g.molten_virt_text_output = true

            -- this will make it so the output shows up below the \`\`\` cell delimiter
            vim.g.molten_virt_lines_off_by_1 = true

            vim.api.nvim_set_hl(0, "MoltenVirtualText", { fg = "#000000", bg = "#FFFFFF" })

            vim.keymap.set("n", "<space>mi", ":MoltenInit<CR>",
                { silent = true, desc = "Initialize the plugin" })
            vim.keymap.set("n", "<space>e", ":MoltenEvaluateOperator<CR>",
                { silent = true, desc = "run operator selection" })
            vim.keymap.set("n", "<space>rl", ":MoltenEvaluateLine<CR>",
                { silent = true, desc = "evaluate line" })
            vim.keymap.set("n", "<space>rr", ":MoltenReevaluateCell<CR>",
                { silent = true, desc = "re-evaluate cell" })
            vim.keymap.set("v", "<space>r", ":<C-u>MoltenEvaluateVisual<CR>gv",
                { silent = true, desc = "evaluate visual selection" })
            vim.keymap.set("n", "<space>so", ":MoltenShowOutput<CR>", { desc = "show output window", silent = true })
        end,
    },
    {
        'quarto-dev/quarto-nvim',
        dependencies = {
            'jmbuhr/otter.nvim',
            'hrsh7th/nvim-cmp',
            'neovim/nvim-lspconfig',
            'nvim-treesitter/nvim-treesitter'
        },

        ft = { "quarto", "markdown" },

        config = function()
            require "configs.quarto"
        end,
    },

}
