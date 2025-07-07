return {
    {
        "sphamba/smear-cursor.nvim",

        event = "VeryLazy",
        config = function()
            require("smear_cursor").setup({
                -- Smear cursor when switching buffers or windows.
                smear_between_buffers = true,

                -- Smear cursor when moving within line or to neighbor lines.
                -- Use `min_horizontal_distance_smear` and `min_vertical_distance_smear` for finer control
                smear_between_neighbor_lines = true,

                -- Draw the smear in buffer space instead of screen space when scrolling
                scroll_buffer_space = true,

                -- Set to `true` if your font supports legacy computing symbols (block unicode symbols).
                -- Smears will blend better on all backgrounds.
                legacy_computing_symbols_support = false,

                -- Smear cursor in insert mode.
                -- See also `vertical_bar_cursor_insert_mode` and `distance_stop_animating_vertical_bar`.
                smear_insert_mode = true,
            })
        end,
    },
    { -- Compiler plugin
        "Zeioth/compiler.nvim",
        cmd = { "CompilerOpen", "CompilerToggleResults", "CompilerRedo" },
        dependencies = {
            "stevearc/overseer.nvim",
            "nvim-telescope/telescope.nvim",
        },
        opts = {},
    },
    { -- Task runner
        "stevearc/overseer.nvim",
        commit = "6271cab7ccc4ca840faa93f54440ffae3a3918bd",
        cmd = { "CompilerOpen", "CompilerToggleResults", "CompilerRedo" },
        opts = {
            task_list = {
                direction = "bottom",
                min_height = 25,
                max_height = 25,
                default_detail = 1,
            },
        },
    },
    {
        "akinsho/toggleterm.nvim",
        version = "*", -- Use latest tagged release
        event = "VeryLazy", -- Optional: lazy-load on startup delay
        config = function()
            require("toggleterm").setup({
                size = function(term)
                    if term.direction == "horizontal" then
                        return 15
                    elseif term.direction == "vertical" then
                        return vim.o.columns * 0.4
                    end
                end,
                open_mapping = [[<C-\>]],
                hide_numbers = true,
                shade_filetypes = {},
                shade_terminals = true,
                shading_factor = 2,
                start_in_insert = true,
                insert_mappings = true,
                persist_size = true,
                direction = "float", -- "vertical" | "float" | "tab"
                close_on_exit = true,
                shell = vim.o.shell,
                float_opts = {
                    border = "curved",
                    winblend = 2,
                    title_pos = "center",
                },
            })
        end,
    },
    {
        "kevinhwang91/nvim-ufo",
        dependencies = {
            "kevinhwang91/promise-async",
            "nvim-treesitter/nvim-treesitter",
        },
        event = "VeryLazy",
    },
    {
        "CRAG666/code_runner.nvim",
        config = function()
            require("code_runner").setup({
                mode = "toggleterm", -- use native floating window
                startinsert = true,
                term = {
                    position = "float",
                    size = 20,
                },
                filetype = {
                    python = "python3 -u",
                    javascript = "node",
                    typescript = "deno run",
                    lua = "lua",
                    c = {
                        "cd $dir && gcc $fileName -o $fileNameWithoutExt && ./$fileNameWithoutExt && rm $fileNameWithoutExt",
                    },
                    cpp = {
                        "cd $dir && g++ $fileName -o $fileNameWithoutExt && ./$fileNameWithoutExt && rm $fileNameWithoutExt",
                    },
                    java = {
                        "cd $dir && javac $fileName && java $fileNameWithoutExt",
                    },
                    rust = {
                        "cd $dir && rustc $fileName && ./$fileNameWithoutExt",
                    },
                    go = "go run $fileName",
                    sh = "bash $fileName",
                },
            })
        end,
        event = "VeryLazy",
    },
    {
        "nvim-treesitter/nvim-treesitter",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            require("configs.treesitter")
        end,
    },
    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            require("nvchad.configs.lspconfig").defaults()
            require("configs.lspconfig")
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        event = "VeryLazy",
        dependencies = { "nvim-lspconfig" },
        config = function()
            require("configs.mason-lspconfig")
        end,
    },
    {
        "mfussenegger/nvim-lint",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            require("configs.lint")
        end,
    },
    {
        "rshkarin/mason-nvim-lint",
        event = "VeryLazy",
        dependencies = { "nvim-lint" },
        config = function()
            require("configs.mason-lint")
        end,
    },
    {
        "stevearc/conform.nvim",
        event = "BufWritePre",
        config = function()
            require("configs.conform")
        end,
    },
    {
        "zapling/mason-conform.nvim",
        event = "VeryLazy",
        dependencies = { "conform.nvim" },
        config = function()
            require("configs.mason-conform")
        end,
    },
    {
        "github/copilot.vim",
        event = "VeryLazy",
    },
    {
        "mbbill/undotree",
        cmd = { "UndotreeToggle", "UndotreeShow" },
        event = "VeryLazy",
        config = function()
            vim.g.undotree_WindowLayout = 2 -- vertical split
            vim.g.undotree_SplitWidth = 20 -- width of the undotree window
            vim.g.undotree_SetFocusWhenToggle = 1 -- focus undotree when toggled
        end,
    },
    {
        "nvimdev/dashboard-nvim",
        event = "VimEnter",
        config = function()
            require("dashboard").setup({
                theme = "hyper",
                config = {
                    week_header = {
                        enable = false,
                    },
                    header = {
                        "",
                        "██╗  ██╗███████╗██╗     ██╗      ██████╗ ",
                        "██║  ██║██╔════╝██║     ██║     ██╔═══██╗",
                        "███████║█████╗  ██║     ██║     ██║   ██║",
                        "██╔══██║██╔══╝  ██║     ██║     ██║   ██║",
                        "██║  ██║███████╗███████╗███████╗╚██████╔╝",
                        "╚═╝  ╚═╝╚══════╝╚══════╝╚══════╝ ╚═════╝ ",
                        "",
                    },
                    shortcut = {
                        {
                            desc = "󰊳 Update",
                            group = "@property",
                            action = "Lazy update",
                            key = "u",
                        },
                        {
                            icon = " ",
                            icon_hl = "@variable",
                            desc = "Files",
                            group = "Label",
                            action = "Telescope find_files",
                            key = "f",
                        },
                    },
                },
            })
        end,
        dependencies = { { "nvim-tree/nvim-web-devicons" } },
    },
    {
        "CopilotC-Nvim/CopilotChat.nvim",
        dependencies = {
            { "github/copilot.vim" }, -- or zbirenbaum/copilot.lua
            { "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
        },
        build = "make tiktoken", -- Only on MacOS or Linux
        opts = {
            -- See Configuration section for options
        },
        -- See Commands section for default commands if you want to lazy load on them
    },
    {
        "CRAG666/betterTerm.nvim",
        opts = {
            position = "bot",
            size = 15,
        },
    },
    {
        "laytan/tailwind-sorter.nvim",
        event = "BufReadPre",
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "nvim-lua/plenary.nvim",
        },
        build = "cd formatter && npm ci && npm run build",
        config = true,
    },
    {
        "luckasRanarison/tailwind-tools.nvim",
        name = "tailwind-tools",
        lazy = false,
        build = ":UpdateRemotePlugins",
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "nvim-telescope/telescope.nvim", -- optional
            "neovim/nvim-lspconfig", -- optional
        },
        opts = {}, -- your configuration
    },
    {
        "NvChad/nvim-colorizer.lua",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            require("colorizer").setup({
                filetypes = { "*" },
                user_default_options = {
                    names = false,
                    mode = "background",
                    tailwind = true,
                    sass = { enable = true, parsers = { "css" } },
                    -- Add these options to prevent conflicts
                    always_update = false,
                },
            })

            -- Safely enable colorizer
            vim.defer_fn(function()
                require("colorizer").attach_to_buffer(0)
            end, 100)
        end,
    },
    {
        "HiPhish/rainbow-delimiters.nvim",
        event = "VeryLazy",
        config = function()
            local rainbow_delimiters = require("rainbow-delimiters")

            vim.g.rainbow_delimiters = {
                strategy = {
                    [""] = rainbow_delimiters.strategy["global"],
                    vim = rainbow_delimiters.strategy["local"],
                },
                query = {
                    [""] = "rainbow-delimiters",
                    lua = "rainbow-blocks",
                },
                highlight = {
                    "RainbowDelimiterRed",
                    "RainbowDelimiterYellow",
                    "RainbowDelimiterBlue",
                    "RainbowDelimiterOrange",
                    "RainbowDelimiterGreen",
                    "RainbowDelimiterViolet",
                    "RainbowDelimiterCyan",
                },
            }
        end,
    },
    -- {
    --     "hrsh7th/nvim-cmp",
    --     dependencies = {
    --         { "micangl/cmp-vim-path" },
    --     },
    --     opts = function(_, opts)
    --         local cmp = require("cmp")
    --         opts.sources =
    --             cmp.config.sources(vim.tbl_extend("force", opts.sources, {
    --                 { name = "vim-path" },
    --             }))
    --     end,
    -- },
}
