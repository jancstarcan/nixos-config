{ pkgs, ... }:
{
	home.packages = with pkgs; [ wofi ];
	programs.wofi = {
		enable = true;
		settings = {
			show="drun";
			width="40%";
			height="50%";
			prompt="Search..";
			normal_window=true;
			location="center";
			gtk-dark=true;
			allow_images=true;
			image_size=32;
			insensitive=true;
			allow_markup=true;
			no_actions=true;
			orientation="vertical";
			halign="fill";
			content_halign="fill";
		};
		style = builtins.readFile ../config/wofi/style.css;
	};
}
