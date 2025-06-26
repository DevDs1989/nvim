local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require("lspconfig")

-- list of all servers configured.
lspconfig.servers = {
    "lua_ls",
    "clangd",
    -- "gopls",
    -- "hls",
    -- "ols",
    "pyright",
    -- "html",
    "cssls",
    "ts_ls",
    "tailwindcss",
    "eslint",
    "html",
    "emmet_language_server",
}

-- list of servers configured with default config.
local default_servers = {
    "ols",
    "pyright",
}

-- lsps with default config
for _, lsp in ipairs(default_servers) do
    lspconfig[lsp].setup({
        on_attach = on_attach,
        on_init = on_init,
        capabilities = capabilities,
    })
end

lspconfig.tailwindcss.setup({
    cmd = { "tailwindcss-language-server", "--stdio" },
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
    filetypes = {
        "javascript",
        "javascriptreact",
        "typescript",
        "typescriptreact",
        "html",
        "css",
        "scss",
        "less",
        "vue",
        "svelte",
    },
    root_dir = lspconfig.util.root_pattern(
        "tailwind.config.js",
        "tailwind.config.ts",
        "postcss.config.js",
        ".git"
    ),
})

lspconfig.emmet_language_server.setup({
    filetypes = {
        "css",
        "eruby",
        "html",
        "javascript",
        "javascriptreact",
        "less",
        "sass",
        "scss",
        "pug",
        "typescript",
        "typescriptreact",
    },
    -- Read more about this options in the [vscode docs](https://code.visualstudio.com/docs/editor/emmet#_emmet-configuration).
    -- **Note:** only the options listed in the table are supported.
    init_options = {
        ---@type table<string, string>
        includeLanguages = {},
        --- @type string[]
        excludeLanguages = {},
        --- @type string[]
        extensionsPath = {},
        --- @type table<string, any> [Emmet Docs](https://docs.emmet.io/customization/preferences/)
        preferences = {},
        --- @type boolean Defaults to `true`
        showAbbreviationSuggestions = true,
        --- @type "always" | "never" Defaults to `"always"`
        showExpandedAbbreviation = "always",
        --- @type boolean Defaults to `false`
        showSuggestionsAsSnippets = false,
        --- @type table<string, any> [Emmet Docs](https://docs.emmet.io/customization/syntax-profiles/)
        syntaxProfiles = {},
        --- @type table<string, string> [Emmet Docs](https://docs.emmet.io/customization/snippets/#variables)
        variables = {},
    },
})

-- lspconfig.emmet_ls.setup({
--     -- on_attach = on_attach,
--     capabilities = capabilities,
--     filetypes = {
--         "css",
--         "eruby",
--         "html",
--         "javascript",
--         "javascriptreact",
--         "less",
--         "sass",
--         "scss",
--         "svelte",
--         "pug",
--         "typescript",
--         "typescriptreact",
--         "vue",
--     },
--     init_options = {
--         html = {
--             options = {
--                 -- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267
--                 ["bem.enabled"] = true,
--             },
--         },
--     },
-- })
lspconfig.ts_ls.setup({
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
    filetypes = {
        "javascript",
        "javascriptreact",
        "javascript.jsx",
        "typescript",
        "typescriptreact",
        "typescript.tsx",
    },
    root_dir = lspconfig.util.root_pattern(
        "package.json",
        "tsconfig.json",
        "jsconfig.json",
        ".git"
    ),
    settings = {
        typescript = {
            inlayHints = {
                includeInlayParameterNameHints = "all",
                includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                includeInlayFunctionParameterTypeHints = true,
                includeInlayVariableTypeHints = true,
                includeInlayPropertyDeclarationTypeHints = true,
                includeInlayFunctionLikeReturnTypeHints = true,
                includeInlayEnumMemberValueHints = true,
            },
        },
        javascript = {
            inlayHints = {
                includeInlayParameterNameHints = "all",
                includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                includeInlayFunctionParameterTypeHints = true,
                includeInlayVariableTypeHints = true,
                includeInlayPropertyDeclarationTypeHints = true,
                includeInlayFunctionLikeReturnTypeHints = true,
                includeInlayEnumMemberValueHints = true,
            },
        },
    },
})

lspconfig.eslint.setup({
    on_attach = function(client, bufnr)
        client.server_capabilities.documentFormattingProvider = true
        on_attach(client, bufnr)
    end,
    on_init = on_init,
    capabilities = capabilities,
    filetypes = {
        "javascript",
        "javascriptreact",
        "typescript",
        "typescriptreact",
        "html",
    },
    settings = {
        workingDirectory = { mode = "auto" },
    },
})
lspconfig.clangd.setup({
    on_attach = function(client, bufnr)
        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.documentRangeFormattingProvider = false
        on_attach(client, bufnr)
    end,
    on_init = on_init,
    capabilities = capabilities,
})

-- lspconfig.gopls.setup({
--     on_attach = function(client, bufnr)
--         client.server_capabilities.documentFormattingProvider = false
--         client.server_capabilities.documentRangeFormattingProvider = false
--         on_attach(client, bufnr)
--     end,
--     on_init = on_init,
--     capabilities = capabilities,
--     cmd = { "gopls" },
--     filetypes = { "go", "gomod", "gotmpl", "gowork" },
--     root_dir = lspconfig.util.root_pattern("go.work", "go.mod", ".git"),
--     settings = {
--         gopls = {
--             analyses = {
--                 unusedparams = true,
--             },
--             completeUnimported = true,
--             usePlaceholders = true,
--             staticcheck = true,
--         },
--     },
-- })
--
-- lspconfig.hls.setup({
--     on_attach = function(client, bufnr)
--         client.server_capabilities.documentFormattingProvider = false
--         client.server_capabilities.documentRangeFormattingProvider = false
--         on_attach(client, bufnr)
--     end,
--
--     on_init = on_init,
--     capabilities = capabilities,
-- })

lspconfig.lua_ls.setup({
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,

    settings = {
        Lua = {
            diagnostics = {
                enable = false, -- Disable all diagnostics from lua_ls
                -- globals = { "vim" },
            },
            workspace = {
                library = {
                    vim.fn.expand("$VIMRUNTIME/lua"),
                    vim.fn.expand("$VIMRUNTIME/lua/vim/lsp"),
                    vim.fn.stdpath("data") .. "/lazy/ui/nvchad_types",
                    vim.fn.stdpath("data") .. "/lazy/lazy.nvim/lua/lazy",
                    "${3rd}/love2d/library",
                },
                maxPreload = 100000,
                preloadFileSize = 10000,
            },
        },
    },
})
