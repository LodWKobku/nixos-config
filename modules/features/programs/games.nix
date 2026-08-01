{ self, inputs, ... }: {
    flake.nixosModules.games = { pkgs, lib, config, ... }: {
        # Steam
        programs.steam = {
            enable = true;
            remotePlay.openFirewall = true;
            dedicatedServer.openFirewall = true;
            extraCompatPackages = [ pkgs.proton-ge-bin ];
        };
        # Lutris
        home-manager.sharedModules = [{
            programs.lutris = {
                enable = true;
                extraPackages = with pkgs; [mangohud winetricks gamescope gamemode umu-launcher];
            };
        }];

        # Others
        environment.systemPackages = with pkgs; [
            prismlauncher   # Minecraft
        ];

        # Gamemode
        programs.gamemode.enable = true;
        users.users.user.extraGroups = [ "gamemode" ];
    };
}
