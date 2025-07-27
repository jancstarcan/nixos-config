{ pkgs, ... }:

{
	home.packages = with pkgs; [
		vscode-langservers-extracted
		nil
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
				mini.surround.enable = true;
				autopairs.nvim-autopairs.enable = true;
				visuals.indent-blankline = {
					enable = true;
					setupOpts.scope.enabled = true;
				};
				utility.motion.leap = {
					enable = true;
					mappings = {
						leapForwardTo = "<Leader>s";
						leapForwardTill = "";
						leapBackwardTo = "<leader>S";
						leapBackwardTill = "";
					};
				};
				comments.comment-nvim.enable = true;
				ui.noice.enable = true;

				autocomplete.nvim-cmp.enable = true;
				lsp = {
					enable = true;
					servers = {
						cssls = {};
						nil_ls = {};
						html = {};
						tsserver = {};
					};
				};
				languages = {
					enableTreesitter = true;

					nix.enable = true;
					ts.enable = true;
					html.enable = true;
				};
			};
		};
	};
}
