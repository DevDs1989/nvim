return {
    { "JoosepAlviste/nvim-ts-context-commentstring" },
    { -- This plugin
        "Zeioth/compiler.nvim",
        cmd = { "CompilerOpen", "CompilerToggleResults", "CompilerRedo" },
        dependencies = {
            "stevearc/overseer.nvim",
            "nvim-telescope/telescope.nvim",
        },
        opts = {},
    },
    { -- The task runner we use
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
        { "JoosepAlviste/nvim-ts-context-commentstring" },
        { -- This plugin
            "Zeioth/compiler.nvim",
            cmd = { "CompilerOpen", "CompilerToggleResults", "CompilerRedo" },
            dependencies = {
                "stevearc/overseer.nvim",
                "nvim-telescope/telescope.nvim",
            },
            opts = {},
        },
        { -- The task runner we use
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
            config = true,
            opts = {
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
            },
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
                                icon = " ",
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
        -- {
        --     "goolord/alpha-nvim",
        --     dependencies = { "echasnovski/mini.icons" },
        --     config = function()
        --         require("alpha").setup(require("alpha.themes.dashboard").config)
        --     end,
        -- },
        {
            "CRAG666/code_runner.nvim",
            config = function()
                require("code_runner").setup({
                    filetype = {
                        java = {
                            "cd $dir &&",
                            "javac $fileName &&",
                            "java $fileNameWithoutExt",
                        },
                        python = "python3 -u",
                        typescript = "deno run",
                        rust = {
                            "cd $dir &&",
                            "rustc $fileName &&",
                            "$dir/$fileNameWithoutExt",
                        },
                        c = function(...)
                            c_base = {
                                "cd $dir &&",
                                "gcc $dir/$fileName -o",
                                "$dir/$fileNameWithoutExt",
                            }
                            local c_exec = {
                                "&& %dir/$fileNameWithoutExt &&",
                                "rm $dir/$fileNameWithoutExt",
                            }
                            vim.ui.input(
                                { prompt = "Add more args:" },
                                function(input)
                                    c_base[4] = input
                                    vim.print(
                                        vim.tbl_extend("force", c_base, c_exec)
                                    )
                                    require("code_runner.commands").run_from_fn(
                                        vim.list_extend(c_base, c_exec)
                                    )
                                end
                            )
                        end,
                    },
                })
            end,
            event = "VeryLazy",
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
            opts = {
                user_default_options = {
                    names = false,
                    mode = "background",
                    tailwind = true,
                    sass = { enable = true, parsers = { "css" } },
                },
            },
        },
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
                            icon = " ",
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
    -- {
    --     "goolord/alpha-nvim",
    --     dependencies = { "echasnovski/mini.icons" },
    --     config = function()
    --         require("alpha").setup(require("alpha.themes.dashboard").config)
    --     end,
    -- },
    {
        "CRAG666/code_runner.nvim",
        config = function()
            require("code_runner").setup({
                filetype = {
                    java = {
                        "cd $dir &&",
                        "javac $fileName &&",
                        "java $fileNameWithoutExt",
                    },
                    python = "python3 -u",
                    typescript = "deno run",
                    rust = {
                        "cd $dir &&",
                        "rustc $fileName &&",
                        "$dir/$fileNameWithoutExt",
                    },
                    c = function(...)
                        c_base = {
                            "cd $dir &&",
                            "gcc $dir/$fileName -o",
                            "$dir/$fileNameWithoutExt",
                        }
                        local c_exec = {
                            "&& %dir/$fileNameWithoutExt &&",
                            "rm $dir/$fileNameWithoutExt",
                        }
                        vim.ui.input(
                            { prompt = "Add more args:" },
                            function(input)
                                c_base[4] = input
                                vim.print(
                                    vim.tbl_extend("force", c_base, c_exec)
                                )
                                require("code_runner.commands").run_from_fn(
                                    vim.list_extend(c_base, c_exec)
                                )
                            end
                        )
                    end,
                },
            })
        end,
        event = "VeryLazy",
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
        opts = {
            user_default_options = {
                names = false,
                mode = "background",
                tailwind = true,
                sass = { enable = true, parsers = { "css" } },
            },
        },
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

    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            { "micangl/cmp-vim-path" },
        },
        opts = function(_, opts)
            local cmp = require("cmp")
            opts.sources =
                cmp.config.sources(vim.tbl_extend("force", opts.sources, {
                    { name = "vim-path" },
                }))
        end,
    },
}
