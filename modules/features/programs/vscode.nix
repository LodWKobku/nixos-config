{ self, inputs, ... }: {
    flake.homeModules.vscode = { pkgs, lib, config, ... }: {
        programs.vscode = {
            enable = true;
            profiles.default = {
                extensions = with pkgs.vscode-extensions; [
                    mhutchie.git-graph
                    bbenoist.nix
                    catppuccin.catppuccin-vsc-icons
                    leonardssh.vscord
                    # Python
                    ms-python.python
                    ms-python.debugpy
                    ms-python.vscode-pylance
                    # Dev containters
                    ms-vscode-remote.remote-containers 
                    mkhl.direnv	
                ];
                userSettings = {
                    "workbench.iconTheme" = "catppuccin-frappe";
                    "chat.disableAIFeatures" = true;
                    "python.defaultInterpreterPath"= "${pkgs.python313}/bin/python";
                    "terminal.integrated.fontFamily"= "JetBrainsMono NFM";
                    # Discord Rich Presence
                    "vscord.status.problems.enabled"= false;
                };
            };
	    };
    };
}