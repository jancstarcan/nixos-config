{ ... }:

{
	programs.nvf = {
		enable = true;
		vim.viAlias = false;
		vim.vimAlias = true;
		vim.lsp = {
			enable = true;
		};
	};
}
