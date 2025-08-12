{ pkgs, ... }: 
let
mod = "Mod4";

left = "h";
up = "k";
right = "l";
down = "j";

term = "kitty";
browser = "librewolf";
menu = "wofi";

monitor1 = "DP-1";
monitor2 = "HDMI-A-1";
in {
	home.packages = with pkgs; [
		grim
		slurp
		xdg-user-dirs
	];
	services.swaync.enable = false;
	wayland.windowManager.sway = {
		enable = true;
		config = {
			modifier = "${mod}";
			floating.modifier = "${mod}";
			input."type:pointer" = {
				accel_profile = "flat";
				left_handed = "disabled";
				tap = "disabled";
				natural_scroll = "disabled";
				dwt = "disabled";
			};
			startup = [
			{
				command = "swww-daemon";
			}
			];

			window.titlebar = false;
			floating.titlebar = false;

			gaps.inner = 10;
			window.border = 2;

			seat = {
				"*" = {
					xcursor_theme = "capitaine-cursors 24";
				};
			};

			bars = [
			{
				command = "waybar";
			}
			];

			workspaceOutputAssign = [
			{workspace = "1"; output="${monitor1}";}
			{workspace = "2"; output="${monitor1}";}
			{workspace = "3"; output="${monitor1}";}
			{workspace = "4"; output="${monitor1}";}
			{workspace = "5"; output="${monitor1}";}
			{workspace = "6"; output="${monitor2}";}
			{workspace = "7"; output="${monitor2}";}
			{workspace = "8"; output="${monitor2}";}
			{workspace = "9"; output="${monitor2}";}
			{workspace = "10"; output="${monitor2}";}
			];

			keybindings = {
# Screenshots
				"${mod}+p" = "exec ~/.scripts/screenshot.sh area";
				"${mod}+shift+p" = "exec ~/.scripts/screenshot.sh active";
				"${mod}+shift+mod1+p" = "exec ~/.scripts/screenshot.sh full";

				"${mod}+mod1+p" = "exec ~/.scripts/picker.sh";

# Utils
				"${mod}+shift+r" = "exec ~/.scripts/reloadwaybar.sh";

				"${mod}+q" = "kill";

				"${mod}+shift+c" = "reload";
				"${mod}+shift+e" = "exec swaynag -t warning -m 'You pressed the exit shortcut. Do you really want to exit sway? This will end your Wayland session.' -B 'Yes, exit sway' 'swaymsg exit'";

# Layout
				"${mod}+r" = ''mode "resize"'';

				"${mod}+b" = "splith";
				"${mod}+v" = "splitv";

				"${mod}+s" = "layout stacking";
				"${mod}+w" = "layout tabbed";
				"${mod}+e" = "layout toggle split";

				"${mod}+f" = "fullscreen";

				"${mod}+shift+space" = "floating toggle";

				"${mod}+d" = "focus mode_toggle";

				"${mod}+a" = "focus parent";

				"${mod}+Shift+minus" = "move scratchpad";
				"${mod}+minus" = "scratchpad show";

# Programs
				"${mod}+return" = "exec ${term}";
				"${mod}+shift+w" = "exec ${browser}";
				"${mod}+space" = "exec ${menu}";

# Navigation
				"${mod}+${left}" = "focus left";
				"${mod}+${up}" = "focus up";
				"${mod}+${right}" = "focus right";
				"${mod}+${down}" = "focus down";

				"${mod}+left" = "focus left";
				"${mod}+up" = "focus up";
				"${mod}+right" = "focus right";
				"${mod}+down" = "focus down";

				"${mod}+shift+${left}" = "move left";
				"${mod}+shift+${up}" = "move up";
				"${mod}+shift+${right}" = "move right";
				"${mod}+shift+${down}" = "move down";

				"${mod}+shift+left" = "move left";
				"${mod}+shift+up" = "move up";
				"${mod}+shift+right" = "move right";
				"${mod}+shift+down" = "move down";

# Workspaces	
				"${mod}+1" = "workspace number 1";
				"${mod}+2" = "workspace number 2";
				"${mod}+3" = "workspace number 3";
				"${mod}+4" = "workspace number 4";
				"${mod}+5" = "workspace number 5";
				"${mod}+mod1+1" = "workspace number 6";
				"${mod}+mod1+2" = "workspace number 7";
				"${mod}+mod1+3" = "workspace number 8";
				"${mod}+mod1+4" = "workspace number 9";
				"${mod}+mod1+5" = "workspace number 10";

				"${mod}+shift+1" = "move container to workspace number 1";
				"${mod}+shift+2" = "move container to workspace number 2";
				"${mod}+shift+3" = "move container to workspace number 3";
				"${mod}+shift+4" = "move container to workspace number 4";
				"${mod}+shift+5" = "move container to workspace number 5";
				"${mod}+shift+mod1+1" = "move container to workspace number 6";
				"${mod}+shift+mod1+2" = "move container to workspace number 7";
				"${mod}+shift+mod1+3" = "move container to workspace number 8";
				"${mod}+shift+mod1+4" = "move container to workspace number 9";
				"${mod}+shift+mod1+5" = "move container to workspace number 10";
			};
		};
	};
}
