{ ... }:

{
	vim = {
		theme = {
			enable = true;
			name = "gruvbox";
			style = "dark";
		};

		statusline.lualine.enable = true;
		telescope.enable = true;
		autocomplete.nvim-cmp.enable = true;

		languages = {
			lsp.enable = true;
			enableTreesitter = true;

			nix.enable = true;
			ts.enable = true;
			html.enable = true;
		};

                autopairs.nvim-autopairs.enable = true;
                mini.surround.enable = true;
	};
}
