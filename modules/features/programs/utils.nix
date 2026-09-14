{ self, inputs, ... }: {
    flake.nixosModules.utils = { pkgs, lib, config, ... }: {
        environment.systemPackages = with pkgs; [
            gparted
            self.packages.${pkgs.stdenv.hostPlatform.system}.qdirstat
            pear-desktop
            # Proton
            proton-vpn
            proton-pass
            protonmail-desktop
        ];
    };
}