{ pkgs, ... }: {
	home.packages = with pkgs; [ waybar ];
	programs.waybar = {
		enable = true;
		settings = {
			mainBar = {

				layer = "top";
				position = "top";
				height = 32;

				output = [
					"DP-1"
						"HDMI-A-1"
				];

				modules-left = [ "clock" "sway/workspaces" ];
				modules-center = [ "sway/window" ];
				modules-right = [ "cpu" "memory" "disk" "pulseaudio" ];
				"sway/workspaces" = {
					disable-scroll = true;
					all-outputs = true;
					format = "{index}";
					current-only = false;
					persistent-workspaces = {
						"1" = ["DP-1"];
						"2" = ["DP-1"];
						"3" = ["DP-1"];
						"4" = ["DP-1"];
						"5" = ["DP-1"];
						"6" = ["HDMI-A-1"];
						"7" = ["HDMI-A-1"];
						"8" = ["HDMI-A-1"];
						"9" = ["HDMI-A-1"];
						"10" = ["HDMI-A-1"];
					};
				};

				disk = {
					format = "{percentage_used}% 󰋊";
				};
				clock = {
					format = "{:%H:%M}";
				};
				cpu = {
					format = "{usage}% ";
					tooltip = false;
				};
				memory = {
					format = "{}% ";
				};
				pulseaudio = {
					scroll-step = 5;
					format = "{volume}% {icon}";
					format-muted = " {format_source}";
					format-icons = {
						default = ["" "" ""];
					};
					on-click = "pipewire";
				};
			};
		};
		style = builtins.readFile ../config/waybar/style.css;
};
}
