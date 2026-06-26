{ self, inputs, ... }: {
    perSystem = { pkgs, lib, self', ... }: {
        packages.git = inputs.wrapper-modules.wrappers.git.wrap {
            inherit pkgs;
            settings.user = {
                name  = "LodWKobku";
                email = "lodwkobku@gmail.com";
            };
        };
    };
}