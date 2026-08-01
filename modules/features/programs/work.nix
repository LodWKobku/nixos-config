{ self, inputs, ... }: {
    flake.nixosModules.work = { pkgs, lib, config, ... }: {
        environment.systemPackages = with pkgs; [
            libreoffice
            teams-for-linux
        ];
    };
}