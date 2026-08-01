{ self, inputs, ... }: {
    flake.nixosModules.utils = { pkgs, lib, config, ... }: {
        environment.systemPackages = with pkgs; [
            gparted
            qdirstat

            pear-desktop
        ];
    };
}