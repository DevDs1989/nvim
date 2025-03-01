require("nvchad.options")

local o = vim.o

-- Indenting
o.shiftwidth = 2
o.tabstop = 2
o.softtabstop = 2
-- o.cursorlineopt ='both' -- to enable cursorline!
o.number = true
o.relativenumber = true

-- set filetype for .CBL COBOL files.
-- vim.cmd([[ au BufRead,BufNewFile *.CBL set filetype=cobol ]])
