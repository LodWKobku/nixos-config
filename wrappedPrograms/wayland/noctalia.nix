{ self, inputs, ... }: {
  perSystem = { pkgs, lib, self', ... }: {
    packages.noctalia = inputs.wrapper-modules.wrappers.noctalia-shell.wrap {
      inherit pkgs;
      package = pkgs.noctalia;
      runtimePkgs = [
        self'.packages.kitty
      ];
      settings =
        (builtins.fromJSON
          (builtins.readFile ./noctalia.json)).settings;
    };
  };
}