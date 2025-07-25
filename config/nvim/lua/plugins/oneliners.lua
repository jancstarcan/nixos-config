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
		"vedantwpatil/manim-nvim",
	},
}
