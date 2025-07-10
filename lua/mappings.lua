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

--move seleted line up or down

map("v", "J", ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
map("v", "K", ":m '<-2<CR>gv=gv", { noremap = true, silent = true })
-- go down by half but keep cursor in the middle
map("n", "<C-d>", "<C-d>zz", { noremap = true, silent = true })
-- go up by half but keep cursor in the middle
map("n", "<C-u>", "<C-u>zz", { noremap = true, silent = true })
-- go to the next search result and keep cursor in the middle
map("n", "n", "nzz", { noremap = true, silent = true })
-- go to the previous search result and keep cursor in the middle
map("n", "N", "Nzz", { noremap = true, silent = true })
-- undotree

map(
    "n",
    "<leader>dt",
    ":UndotreeToggle<CR>",
    { noremap = true, silent = true, desc = "Toggle undotree" }
)

-- toggle quickfix
