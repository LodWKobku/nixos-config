{ self, inputs, ... }: {
    flake.nixosModules.shell = { pkgs, lib, ... }: {
        imports = [
            self.nixosModules.aiCli
        ];

        home-manager.sharedModules = [
            self.homeModules.git
            self.homeModules.nix-init
        ];
    };
}