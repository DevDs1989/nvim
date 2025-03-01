require("nvchad.mappings")

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
-- map("i", "jk", "<ESC>")
map("n", "<leader>rr", ":RunCode<CR>", { noremap = true, silent = false })
map("n", "<leader>rf", ":RunFile<CR>", { noremap = true, silent = false })
map("n", "<leader>rft", ":RunFile tab<CR>", { noremap = true, silent = false })
map("n", "<leader>rp", ":RunProject<CR>", { noremap = true, silent = false })
map("n", "<leader>rc", ":RunClose<CR>", { noremap = true, silent = false })
map("n", "<leader>crf", ":CRFiletype<CR>", { noremap = true, silent = false })
map("n", "<leader>crp", ":CRProjects<CR>", { noremap = true, silent = false })
-- Keybinding to trigger clang-format via null-ls
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
-- map({ "n", "t" }, "<C-;>", betterTerm.open, { desc = "Open terminal" })
-- Select term focus
-- map({ "n" }, "<leader>tt", betterTerm.select, { desc = "Select terminal" })
-- Create new term
local current = 2
map({ "n" }, "<leader>tn", function()
    betterTerm.open(current)
    current = current + 1
end, { desc = "New terminal" })
