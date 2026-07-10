{ self, inputs, ... }: {
    flake.nixosModules.music = { pkgs, lib, config, ... }: {
        environment.systemPackages = with pkgs; [
            pear-desktop # Youtube music app
            # TODO: Move it somewhere else
            libreoffice
            gparted
        ];
    };
}