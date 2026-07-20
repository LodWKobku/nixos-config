{ self, inputs, ... }: {
    flake.nixosModules.games = { pkgs, lib, config, ... }: {
        # Steam
        programs.steam = {
            enable = true;
            remotePlay.openFirewall = true;
            dedicatedServer.openFirewall = true;
            extraCompatPackages = [ pkgs.proton-ge-bin ];
        };
        # Gamemode
        programs.gamemode.enable = true;
        users.users.user.extraGroups = [ "gamemode" ];
    };
}
