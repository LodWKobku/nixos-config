{ self, inputs, ... }: {
    flake.nixosModules.shell = { pkgs, lib, ... }: {
        imports = [
            self.nixosModules.aiCli
            self.nixosModules.devenv
            self.nixosModules.git
        ];

        home-manager.sharedModules = [
            self.homeModules.nix-init
        ];
    };
}