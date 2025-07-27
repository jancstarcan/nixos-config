{ pkgs, ... }: 
{
		home.packages = with pkgs; [ kitty ];

		programs.kitty = {
			enable = true;
			font.name = "Jetbrains Mono NerdFont";
			font.size = 14;
			extraConfig = builtins.readFile ../config/kitty/kitty.conf;
		};
}
