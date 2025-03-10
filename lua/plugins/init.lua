return {
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

    { "CRAG666/code_runner.nvim", config = true },
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
    { "mattn/emmet-vim" },
    {
        "luckasRanarison/tailwind-tools.nvim",
        name = "tailwind-tools",
        build = ":UpdateRemotePlugins",
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "nvim-telescope/telescope.nvim", -- optional
            "neovim/nvim-lspconfig", -- optional
        },
        opts = {}, -- your configuration
    },
    {
        "Toprun123/PicVim",
        config = function()
            require("picvim").setup()
        end,
    },
}
