{ pkgs, ... }:

let
	myAliases = {
		nrsf = "sudo nixos-rebuild switch --flake /home/jan/.dotfiles/";
		hmsf = "home-manager switch --flake /home/jan/.dotfiles/";
		se = "sudoedit";
		lg = "lazygit";
		".." = "cd ..";
	};
in

	{
	imports = [
		./modules/import-modules.nix
	];
	home.username = "jan";
	home.homeDirectory = "/home/jan";

	home.stateVersion = "25.05";

	home = {
		packages = with pkgs; [
			hello
			capitaine-cursors
			wl-clipboard
			swww
			librewolf
			libgcc
			gcc
			yazi
			legcord
			qbittorrent
			ntfs3g
			bitwarden
			lazygit
			prismlauncher
			gradle
			cmatrix
			tgpt
			btop
			zoxide
			fzf
			freecad-wayland
			mesa
			neovim
			lua-language-server
			wl-color-picker
			solvespace
			bat
		];

		sessionVariables = {
			EDITOR = "nvim";
			SUDO_EDITOR = "nvim";
		};
		pointerCursor = {
			name = "capitaine-cursors";
			package = pkgs.capitaine-cursors;
			size = 24;
		};
	};

	gtk = {
		enable = true;
		cursorTheme = {
			name = "capitaine-cursors";
			package = pkgs.capitaine-cursors;
			size = 24;
		};
	};

	systemd.user.startServices = true;

	programs = {
		java-language-server.enable = true;
		bash = {
			enable = true;
			shellAliases = myAliases;
		};
		zsh = {
			enable = true;
			shellAliases = myAliases;
		};
		zoxide = {
			enableZshIntegration = true;
		};
		git = {
			enable = true;
			userName = "jancstarcan";
			userEmail = "jan.cadezsmo@gmail.com";
			extraConfig = {
				init.defaultBranch = "main";
			};
		};
	};

	# Let Home Manager install and manage itself.
	programs.home-manager.enable = true;
}
