{ self, inputs, ... }: {
    flake.nixosModules.discord = { pkgs, lib, config, ... }: {
        environment.systemPackages = with pkgs; [
            discord
        ];
    };
}