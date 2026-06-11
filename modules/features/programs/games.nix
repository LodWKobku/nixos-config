{ self, inputs, ... }: {
    flake.nixosModules.games = { pkgs, lib, config, ... }: {
        programs.steam = {
            enable = true;
            remotePlay.openFirewall = true;
            dedicatedServer.openFirewall = true;
        };
    };
}