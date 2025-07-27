{ pkgs, ... }:

{
	home.packages = with pkgs; [
		neovim

		vscode-langservers-extracted
		emmet-ls
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
						leapBackwardTo = "<leader>S";
					};
				};
				comments.comment-nvim.enable = true;
				ui.noice.enable = true;

				snippets.luasnip.enable = true;
				autocomplete.nvim-cmp = {
					enable = true;
					mappings = {
						next = "<C-j>";
						previous = "<C-k>";
					};
				};
				lsp = {
					enable = true;
					servers = {
						cssls = {};
						emmet_ls = {};
					};
				};
				languages = {
					enableTreesitter = true;

					nix.enable = true;
					ts.enable = true;
					html.enable = true;
					lua.enable = true;
				};
			};
		};
	};
}
