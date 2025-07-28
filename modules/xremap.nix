{ pkgs, ... }: {
	services.xremap = {
			enable = true;
			package = pkgs.xremap;
			withGnome = false;
			extraArgs = ["--watch"];

			config = {
				keymap = [
				{
					name = "Caps and hjkl -> arrows";
					remap = {
						Ctrl_R-h = "Left";
						Ctrl_R-j = "Down";
						Ctrl_R-k = "Up";
						Ctrl_R-l = "Right";
					};
				}
				];
				modmap = [
				{
					name = "CapsLock to Esc/RControl";
					remap = {
						CapsLock = {
							held = "Ctrl_R";
							alone = "Esc";
							alone_timeout = 150;
						};
						Esc = {
							held = "Grave";
							alone = "Grave";
							alone_timeout = 0;
						};
						Grave = {
							held = "CapsLock";
							alone = "CapsLock";
							alone_timeout = 0;
						};
					};
				}
				];
			};
		};
	}
