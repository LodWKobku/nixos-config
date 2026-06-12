{ self, inputs, ... }: {
    flake.homeModules.discord = { pkgs, lib, config, ... }: {
        programs.vesktop = {
            enable = true;
        };
    };
}