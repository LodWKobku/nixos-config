{ self, inputs, ... }: {
    perSystem = { pkgs, lib, self', ... }: {
        packages.labwc = inputs.wrappers.lib.wrapPackage {
            inherit pkgs;
            package = pkgs.labwc;
            runtimeInputs = [
                self'.packages.noctalia
            ];
            env = 
            let
            environment = {
                # This is content of envirement file managed by labwc. Using env = {} wrom wrappers is recomended
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
                        <action name="Execute" command="${lib.getExe self'.packages.rofi} -show run" />
                    </keybind>
                </keyboard>
                </labwc_config>
            '';
            autostart = [
                "${lib.getExe pkgs.swaybg} -c '#334455'" # Background
                (lib.getExe pkgs.networkmanagerapplet) # Network Managment
                (lib.getExe self'.packages.noctalia)
            ];
            menu = ''
                <?xml version="1.0" ?>
                <openbox_menu>
                    <menu id="root-menu" label="">
                        <item label="Terminal"><action name="Execute" command="${lib.getExe self'.packages.kitty}"/></item>
                        <item label="Reconfigure"><action name="Reconfigure"/></item>
                        <item label="Exit"><action name="Exit"/></item>
                    </menu>
                </openbox_menu>
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
                            (writeFile {
                                name = "autostart";
                                text = lib.strings.concatStringsSep " & " autostart;
                            })
                            (writeFile {
                                name = "menu.xml";
                                text = menu;
                            })
                        ];
                };
            };
        };
    };
}
