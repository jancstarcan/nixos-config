{ pkgs, ... }:

{
	home.packages = with pkgs; [
		vscode-langservers-extracted
	];
	programs.nvf = {
		enable = true;
		settings = {
			vim = {
				options = {
					tabstop = 4;
					shiftwidth = 4;
					smartindent = true;
					expandtab = false;
					cursorline = true;
					clipboard = "unnamedplus";
				};
				theme = {
					enable = true;
					name = "gruvbox";
					style = "dark";
					transparent = true;
				};

				statusline.lualine.enable = true;
				telescope.enable = true;
				autocomplete.nvim-cmp.enable = true;

				lsp = {
					enable = true;
					servers = {
						cssls = {};
					};
				};
				languages = {
					enableTreesitter = true;

					nix.enable = true;
					ts.enable = true;
					rust.enable = true;
				};
			};
		};
	};
}
