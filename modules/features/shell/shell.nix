{ self, inputs, ... }: {
    flake.nixosModules.shell = { pkgs, lib, ... }: {
        imports = [
            self.nixosModules.aiCli
            self.nixosModules.devenv
        ];

        home-manager.sharedModules = [
            self.homeModules.git
            self.homeModules.nix-init
        ];
    };
}