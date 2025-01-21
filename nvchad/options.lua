require "nvchad.options"

-- add yours here!

local o = vim.o
o.cursorlineopt = 'both' -- to enable cursorline!
o.cmdheight = 0
o.number = false

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "*.ejs",
  callback = function()
    vim.bo.filetype = "html"
  end,
})


if vim.g.neovide then
  vim.o.guifont = "Roboto Mono:h13"
  vim.g.neovide_padding_top = 0
  vim.g.neovide_padding_bottom = 0
  vim.g.neovide_padding_right = 0
  vim.g.neovide_padding_left = 0
  vim.g.neovide_position_animation_length = 0
  vim.g.neovide_hide_mouse_when_typing = true
end
