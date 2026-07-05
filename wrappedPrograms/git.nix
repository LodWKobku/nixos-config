{ self, inputs, ... }: {
    perSystem = { pkgs, lib, self', ... }: {
        packages.git = pkgs.symlinkJoin {
            name = "git";
            paths = [
                (inputs.wrapper-modules.wrappers.git.wrap {
                    inherit pkgs;
                    settings = {
                        "credential \"https://github.com\"" = {
                            "helper" = "!${lib.getExe pkgs.gh} auth git-credential";
                        };
                        "credential \"https://gist.github.com\"" = {
                            "helper" = "!${lib.getExe pkgs.gh} auth git-credential";
                        };
                        user = {
                            name  = "LodWKobku";
                            email = "lodwkobku@gmail.com";
                        };
                    };
                })
                pkgs.gh
            ];
        };
    };
}