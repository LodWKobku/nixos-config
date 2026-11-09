{ self, inputs, ... }: {
    perSystem = { pkgs, lib, self', ... }: {
        packages.opencode = inputs.wrapper-modules.wrappers.opencode.wrap {
            inherit pkgs;
            env.OPENCODE_CONFIG_DIR = pkgs.buildEnv {
                name = "opencode-config";
                paths = 
                let
                    writeFile = { name, text }: pkgs.writeTextFile {
                        inherit name text;
                        destination = "/${name}";
                    };
                in [
                    (writeFile {
                        name = "cli.json";
                        text = (builtins.toJSON {
                            "theme"= {
                                "name"= "catppuccin-frappe";
                                "mode"= "dark";
                            };
                        });
                    })
                ];
            };
        };
    };
}