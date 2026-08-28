{ self, inputs, ... }: {
    flake.nixosModules.wayfire = { pkgs, lib, config, ... }: {
        programs.wayfire = {
            enable = true;
            package = self.packages.${pkgs.stdenv.hostPlatform.system}.wayfire;
            # Configs are in wrappedPrograms/wayfire.nix
        };

        services.greetd = {
            enable = true;
            settings = {
                default_session = {
                    command = "${lib.getExe pkgs.tuigreet} --time --cmd wayfire";
                    user = "greeter";
                };
            };
        };
    };
}