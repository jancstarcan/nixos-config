{ pkgs, ... }:

{
	imports =
		[
			./hardware-configuration.nix
		];

	# Bootloader
	boot.loader.systemd-boot.enable = false;
	boot.loader.grub = {
		enable = true;
		devices = [ "nodev" ];
		efiSupport = true;
		efiInstallAsRemovable = true;
	};
	boot.loader.efi.canTouchEfiVariables = false;

	services.udev.extraRules = ''
		KERNEL=="uinput", GROUP="input", MODE="0660", OPTIONS+="static_node=uinput"
	'';

	# Time zone
	time.timeZone = "Europe/Ljubljana";

	# Enable the windowing system.
	services.xserver = {
		enable = true;
	};

	# Users
	users.users.jan = {
		isNormalUser = true;
		extraGroups = [ "wheel" "input" ];
			shell = pkgs.zsh;
		packages = with pkgs; [
		legcord
		];
	};

	services.seatd.enable = true;
	security.pam.services.sway.enableGnomeKeyring = true;

	programs.sway.enable = true;

	# Shell
	environment.shells = with pkgs; [ zsh bash ];
	users.defaultUserShell = pkgs.zsh;
	programs.zsh = {
		enable = true;
		ohMyZsh = {
			enable = true;
			theme = "simple";
		};
	};
	# Programs

	# List packages installed in system profile.
	# You can use https://search.nixos.org/ to find more packages (and options).
	environment.systemPackages = with pkgs; [
		ly
			vim
			wget
			git
			fastfetch
			tree
			xwayland
			sway
	];

	nixpkgs.config.allowUnfree = true;

	fonts = {
		enableDefaultPackages = true;
		fontconfig.enable = true;
		packages = with pkgs; [
			nerd-fonts.jetbrains-mono
		];
	};

	# Display manager
	services.displayManager.ly.enable = true;

	# NixOS version
	system.stateVersion = "25.05";

    # Experimental features
	nix.settings.experimental-features = [ "nix-command" "flakes" ];
}
