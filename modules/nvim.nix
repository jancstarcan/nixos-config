{ pkgs, ... }: {
	home = {
		packages = with pkgs; [
			neovim

				bash-language-server
				pyright
				nil
				typescript-language-server
				vscode-langservers-extracted
				nodePackages.prettier
				shfmt
				black
				stylua
				nixpkgs-fmt
		];
		file.".config/nvim" = {
			source = ../config/nvim;
			recursive = true;
		};
	};
			   }
