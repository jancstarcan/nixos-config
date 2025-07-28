{ pkgs, ... }: {
	services.xremap = {
			enable = true;
			package = pkgs.xremap;
			withGnome = false;
			extraArgs = ["--watch"];

		config = {
			modmap = [
				{
					name = "CapsLock to Esc/RControl";
					remap = {
						"Capslock" = {
							held = "Ctrl_R";
							alone = "Esc";
							alone_timeout = 150;
						};
						"Esc" = {
							held = "Grave";
							alone = "Grave";
							alone_timeout = 150;
						};
						"Grave" = {
							held = "CapsLock";
							alone = "CapsLock";
							alone_timeout = 150;
						};
					};
				}
			];
		};
	};
}
