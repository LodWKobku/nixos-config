{ self, inputs, ... }: {
    flake.nixosModules.work = { pkgs, lib, config, ... }: {
        environment.systemPackages = with pkgs; [
            libreoffice
            teams-for-linux
            gimp
            distrobox
            self.packages.${pkgs.stdenv.hostPlatform.system}.matlab
        ];

        # OBS
        programs.obs-studio = {
            enable = true;
            enableVirtualCamera = true;
        };
    };
}