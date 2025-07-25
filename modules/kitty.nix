{ pkgs, ... }: 
{
	home = {
		packages = with pkgs; [ kitty ];
		file.".config/kitty/kitty.conf".source = ../config/kitty/kitty.conf;
	};
}
