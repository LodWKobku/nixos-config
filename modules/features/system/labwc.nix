{ self, inputs, ... }: {
    flake.nixosModules.labwc = { pkgs, lib, config, ... }: {
        programs.labwc = {
            enable = true;
            package = self.packages.${pkgs.stdenv.hostPlatform.system}.labwc;
            # Configs are in wrappedPrograms/wayfire.nix
        };

        services.greetd = {
            enable = true;
            settings = {
                default_session = {
                    command = "${lib.getExe pkgs.tuigreet} --time --user user --cmd labwc";
                    user = "greeter";
                };
            };
        };
    };
}