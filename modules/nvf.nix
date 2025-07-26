{ pkgs, ... }:

{
        home.packages = with pkgs; [
                vscode-langservers-extracted
        ];
        programs.nvf = {
                enable = true;
                settings = {
                        vim = {
                                additionalRuntimePaths = [ "~/.config/nvim" ];
                                theme = {
                                        enable = true;
                                        name = "gruvbox";
                                        style = "dark";
                                };

                                statusline.lualine.enable = true;
                                telescope.enable = true;
                                autocomplete.nvim-cmp.enable = true;

                                lsp = {
                                        enable = true;
                                        servers = {
                                                cssls = {};
                                        };
                                };
                                languages = {
                                        enableTreesitter = true;

                                        nix.enable = true;
                                        ts.enable = true;
                                        rust.enable = true;
                                };
                        };
                };
        };
}
