local function enable_transparency()
	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
	vim.api.nvim_set_hl(0, "LineNr", { bg = "none" })
end

return {
	{
		"folke/tokyonight.nvim",
		"EdenEast/nightfox.nvim",

		config = function()
			enable_transparency()
		end
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		opts = {
			"tokyonight"
		}
	},
	{
		"zaldih/themery.nvim",
		lazy = false,
		config = function()
			require("themery").setup {
				themes = {
					"tokyonight",
					"nightfox",
					"onedark",
				},
				livePreview = true,
				globalAfter = [[vim.api.nvim_set_hl(0, "Normal", { bg = "none" })]],
			}
		end
	}
}
