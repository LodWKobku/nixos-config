{ self, inputs, ... }: {
    flake.homeModules.nix-init = { pkgs, lib, ... }: {
        programs.nix-init = {
            enable = true;
            settings = {
                maintainers = [
                    "LodWKobku"
                ];
            };
        };
    };
}
