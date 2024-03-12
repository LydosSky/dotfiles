-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny
local formatters = require("lvim.lsp.null-ls.formatters")

vim.opt.number = false
vim.opt.cmdheight = 0
vim.opt.wrap = true
vim.diagnostic.config({ virtual_text = false })
vim.opt.background = "light"
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.signcolumn = "no"

vim.keymap.set("i", "jk", "<Esc>")

lvim.colorscheme = "vscode"

lvim.builtin.breadcrumbs.active = false
lvim.builtin.alpha.active = false
lvim.builtin.indentlines.active = false
lvim.format_on_save.enabled = true

local components = require("lvim.core.lualine.components")
lvim.builtin.lualine.sections.lualine_a = { "mode" }
lvim.builtin.lualine.sections.lualine_b = { components.filename }

formatters.setup({
	{ name = "prettier", filetypes = { "html" } },
	{
		name = "stylua",
	},
})

lvim.plugins = {
	{
		"marko-cerovac/material.nvim",
		config = function()
			require("material").setup({
				high_visibility = {
					lighter = true,
				},
				lualine_style = "stealth",
			})
		end,
	},

	{
		"Mofiqul/vscode.nvim",
		config = function()
			require("vscode").setup({})
		end,
	},
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("todo-comments").setup({})
		end,
	},
	{
		"nvim-orgmode/orgmode",
		dependencies = {
			{ "nvim-treesitter/nvim-treesitter", lazy = true },
		},
		config = function()
			-- Load treesitter grammar for org
			require("orgmode").setup_ts_grammar()

			-- Setup treesitter
			require("nvim-treesitter.configs").setup({
				highlight = {
					enable = true,
				},
				ensure_installed = { "org" },
			})

			-- Setup orgmode
			require("orgmode").setup({
				org_agenda_files = "~/orgfiles/**/*",
				org_default_notes_file = "~/orgfiles/refile.org",
			})
		end,
	},
	{
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup({ "css", "scss", "html", "javascript" }, {
				RGB = true, -- #RGB hex codes
				RRGGBB = true, -- #RRGGBB hex codes
				RRGGBBAA = true, -- #RRGGBBAA hex codes
				rgb_fn = true, -- CSS rgb() and rgba() functions
				hsl_fn = true, -- CSS hsl() and hsla() functions
				css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
				css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
			})
		end,
	},
}
