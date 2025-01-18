require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("n", "<leader>q", ":q<CR>", { desc = "Quit" })
map("n", "<TAB>", ":bn<CR>", { desc = "Next Buffer" })
map("n", "<leader>x", ":bd<CR>", { desc = "Delete Buffer" })
map("n", "<leader>gs", ":Neogit<CR>", { desc = "Neogit" })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
