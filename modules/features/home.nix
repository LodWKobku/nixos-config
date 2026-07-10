{ self, inputs, ... }: {
    flake.homeModules.user = { pkgs, ... }: {
        imports = [
            self.homeModules.vscode
            self.homeModules.discord
        ];

        home.username = "user";
        home.homeDirectory = "/home/user";
        home.stateVersion = "26.05";
    };
}
