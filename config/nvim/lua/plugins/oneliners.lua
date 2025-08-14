return {
	{
		'tpope/vim-fugitive',
	},
	{
		'brenoprata10/nvim-highlight-colors',
		config = function()
			require('nvim-highlight-colors').setup({})
		end
	},
	{
		'echasnovski/mini.surround',
		config = function()
			require('mini.surround').setup()
		end
	},
	{
		"windwp/nvim-autopairs",
		config = true,
	},
	{
		'folke/noice.nvim',
		dependencies = { "MunifTanjim/nui.nvim", "rcarriga/nvim-notify" },
		config = function()
			require("noice").setup()
			vim.cmd([[
  hi NotifyBackground guibg=#282828 guifg=#ebdbb2
  hi NotifyERRORBorder guibg=#282828 guifg=#fb4934
  hi NotifyWARNBorder guibg=#282828 guifg=#fabd2f
  hi NotifyINFOBorder guibg=#282828 guifg=#83a598
  hi NotifyDEBUGBorder guibg=#282828 guifg=#8ec07c
  hi NotifyTRACEBorder guibg=#282828 guifg=#d3869b

  hi MasonNormal guibg=#282828
  hi MasonBorder guibg=#282828
  hi MasonWindow guibg=#282828

  hi LazyNormal guibg=#282828
  hi LazyFloat guibg=#282828
  hi LazyBorder guibg=#282828
]])
		end,
	},
	{
		'ggandor/leap.nvim',
		config = function()
			require('leap').add_default_mappings()
		end,
	},
	{
		'lukas-reineke/indent-blankline.nvim',
		main = "ibl",
		opts = {},
		config = function()
			require("ibl").setup({
			})
		end,
	},
}
