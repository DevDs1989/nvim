local lint = require("lint")

lint.linters_by_ft = {
    lua = { "luacheck" },
    -- haskell = { "hlint" },
    python = { "pylint" },
    -- c = { "cpplint" }, -- Add cpplint for C files
    cpp = { "cpplint" }, -- Add cpplint for C++ files
}

lint.linters.luacheck.args = {
    unpack(lint.linters.luacheck.args),
    "--globals",
    "love",
    "vim",
}

vim.api.nvim_create_autocmd({ "bufenter", "bufwritepost", "insertleave" }, {
    callback = function()
        lint.try_lint()
    end,
})

lint.linters.flake8.args = {
    unpack(lint.linters.flake8.args or {}),
    "--ignore=E501,W291", -- E501 is the flake8 code for "line too long"
}

lint.linters.pylint.args = {
    unpack(lint.linters.pylint.args or {}),
    "--disable=C0301,W0511,C0116", -- C0301 is the pylint code for "line too long", W0511 for "fixme comments"
}
lint.linters.cpplint.args = {
    "--filter=-whitespace/indent,-readability/alt_tokens", -- Disable other checks as before
    "--disable=build/copyright", -- Explicitly disable the copyright check
    "--linelength=120", -- Increase max line length for C/C++ files
    "--quiet", -- Reduce output verbosity
    "--recursive", -- Recursively check directories
    "--verbose=3", -- Increase verbosity level (show more details)
}
