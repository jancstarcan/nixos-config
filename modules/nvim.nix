{ pkgs, ... }:
{
	home.pkgs = with pkgs; [
		neovim
	];
	home.file.".config/nvim".source = ../config/nvim;
}
