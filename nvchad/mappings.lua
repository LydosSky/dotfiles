require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("n", "<leader>q", ":q<CR>", { silent = true, desc = "Quit" })
map("n", "<TAB>", ":bn<CR>", { silent = true, desc = "Next Buffer" })
map("n", "<S-TAB>", ":bp<CR>", { silent = true, desc = "Previous Buffer" })
map("n", "<leader>x", ":bd<CR>", { silent = true, desc = "Delete Buffer" })
map("n", "<leader>gs", ":Neogit<CR>", { silent = true, desc = "Neogit" })
map("n", "<leader>rr", ":Rest run<CR>", { silent = true, desc = "Rest Run Under Carrot" })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
