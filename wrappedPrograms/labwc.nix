{ self, inputs, ... }: {
    perSystem = { pkgs, lib, self', ... }: {
        packages.labwc = inputs.wrappers.lib.wrapPackage {
            inherit pkgs;
            package = pkgs.labwc;
            env = 
            let
            environment = {
                XKB_DEFAULT_LAYOUT = "pl";
            };
            rc = ''
                <?xml version="1.0" ?>
                <labwc_config>
                <keyboard>
                    <default />
                    <!-- W - super -->
                    <!-- C - CTRL -->
                    <!-- A - Alt -->
                    <!-- S - Shift -->
                    <keybind key="C-l">
                        <action name="Execute" command="${pkgs.rofi} -show run" />
                    </keybind>
                </keyboard>
                </labwc_config>
            '';
            in
            {
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
                                name = "environment";
                                text = lib.generators.toINIWithGlobalSection {} {
                                    globalSection = environment;
                                };
                            })
                            (writeFile {
                                name = "rc.xml";
                                text = rc;
                            })
                        ];
                };
            };
        };
    };
}
