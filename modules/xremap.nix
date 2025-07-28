{ pkgs, ... }: {
	services.xremap = {
			enable = true;
			package = pkgs.xremap;
			withGnome = false;
			extraArgs = ["--watch"];

			config = {
				keymap = [
				{
					name = "Caplock to Esc";
					remap = {
						CapsLock = "Esc";
						Esc = "Grave";
						Grave = "CapsLock";
					};
				}
				];
			};
		};
	}
