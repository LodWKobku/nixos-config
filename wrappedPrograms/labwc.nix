{ self, inputs, ... }: {
    perSystem = { pkgs, lib, self', ... }: {
        packages.labwc = inputs.wrappers.lib.wrapPackage {
            inherit pkgs;
            package = pkgs.labwc;
            env = {
                XDG_CONFIG_DIRS = pkgs.buildEnv {
                    name = "labwc-config";
                    extraPrefix = "/labwc";
                    paths = 
                        let
                            writeFile = { name, text }: pkgs.writeTextFile {
                                inherit name text;
                                destination = "/${name}";
                            };
                        in [
                            (writeFile {
                                name = "file1";
                                text = "placeholder";
                            })
                            (writeFile {
                                name = "file2";
                                text = "placeholder";
                            })
                        ];
                };
            };
        };
    };
}
