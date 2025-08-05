{ ... }: {
	home = {
		file = {
			"Pictures/Wallpapers/.keep" = {
				text = '''';
			};
			"Pictures/Screenshots/.keep" = {
				text = '''';
			};
			".scripts/captureactive.sh" = {
				executable = true;
				text = ''
#!/home/jan/.nix-profile/bin/zsh
OUTPUT=$(swaymsg -t get_tree | jq -r '
		recurse(.nodes[]?, .floating_nodes[]?) 
		| select(.type == "con" and .focused == true) 
		| .output
		')
grim -c -o "$OUTPUT" "$(xdg-user-dir PICTURES)/Screenshots/$(date +'%s_grim.png')"'';
			};
			".scripts/captureall.sh" = {
				executable = true;
				text = ''
#!/home/jan/.nix-profile/bin/zsh
grim $(xdg-user-dir PICTURES)/Screenshots/$(date +'%s_grim.png')'';
			};
			".scripts/capturearea.sh" = {
				executable = true;
				text = ''
#!/home/jan/.nix-profile/bin/zsh
grim -g "$(slurp)" ~/Pictures/Screenshots/$(date +'%s_grim.png')'';
			};
			".scripts/reloadwaybar.sh" = {
				text = ''
#!/home/jan/.nix-profile/bin/zsh
pkill waybar
swaymsg exec waybar &'';
				executable = true;
			};
		};
	};
}
