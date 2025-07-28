{ ... }:

{
	programs.kanata = {
		enable = true;
		config = {
			keymap = [
				{
					from = "CapsLock";
					to = [
						{ type = "tap"; key = "Escape"; }
						{ type = "hold"; key = "ControlRight"; }
					];
					timeout = 150;
				}
				{
					from = "Escape";
					to = "Grave";
				}
				{
					from = "Grave";
					to = "CapsLock";
				}
			];
		};
	};
}
