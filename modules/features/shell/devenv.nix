{ self, inputs, ... }: {
    flake.nixosModules.devenv = { pkgs, lib, config, ... }: {
        environment.systemPackages = with pkgs; [
            devenv
        ];
        programs.direnv.enable = true;
    };
}