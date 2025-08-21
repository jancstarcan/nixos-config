{ pkgs, ... }:

{
	imports =
		[
			./hardware-configuration.nix
		];

	# Bootloader
	boot = {
		loader.systemd-boot.enable = false;
		loader.grub = {
			enable = true;
			devices = [ "nodev" ];
			efiSupport = true;
			efiInstallAsRemovable = true;
		};
		kernelParams = [ "kvm.enable_virt_at_load=0" ];
	};

	services.udev.extraRules = ''
		KERNEL=="uinput", MODE="0660", GROUP="input", OPTIONS+="static_node=uinput"
	'';

	# Virtualisation
	virtualisation.virtualbox.host.enable = true;

	# Time zone
	time.timeZone = "Europe/Ljubljana";

	# Enable the windowing system.
	services.xserver = {
		enable = true;
	};

	# Users
	users.users.jan = {
		isNormalUser = true;
		extraGroups = [ "wheel" "input" "vboxuser" ];
			shell = pkgs.zsh;
		packages = with pkgs; [
		];
	};

	services.seatd.enable = true;
	security.pam.services.sway.enableGnomeKeyring = true;

	# Display manager
	services.displayManager.ly.enable = true;

	# Window Manager
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
		steam
		go
		cargo
		discord
	];

	# Allow unfree packages
	nixpkgs.config.allowUnfree = true;

	# Fonts
	fonts = {
		enableDefaultPackages = true;
		fontconfig.enable = true;
		packages = with pkgs; [
			nerd-fonts.jetbrains-mono
		];
	};

	# NixOS version
	system.stateVersion = "25.05";

    # Experimental features
	nix.settings.experimental-features = [ "nix-command" "flakes" ];
}
