{ self, inputs, ... }: {
    perSystem = { pkgs, lib, self', ... }: {
        packages.git = pkgs.symlinkJoin {
            name = "git";
            paths = [
                (inputs.wrapper-modules.wrappers.git.wrap {
                    inherit pkgs;
                    settings.user = {
                        name  = "LodWKobku";
                        email = "lodwkobku@gmail.com";
                    };
                })
                pkgs.gh
            ];
        };
    };
}