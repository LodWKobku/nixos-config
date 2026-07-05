{ self, inputs, ... }: {
    flake.nixosModules.music = { pkgs, lib, config, ... }: {
        environment.systemPackages = with pkgs; [
            pear-desktop # Youtube music app
            libreoffice
        ];
    };
}