{ self, inputs, ... }: {
    perSystem = { pkgs, lib, self', ... }: {
        packages.fish = inputs.wrapper-modules.wrappers.fish.wrap {
            inherit pkgs;
            runtimePkgs = [ 
                self'.packages.fastfetch
                self'.packages.starship

                pkgs.devenv
            ];
            plugins = [
                pkgs.fishPlugins.done
            ];
            configFile.content = 
            let
                cd-config = lib.splitString "\n" (builtins.readFile "${pkgs.fish.src}/share/functions/cd.fish");
            in
            ''
                fish_config theme choose catppuccin-frappe
                ${lib.getExe self'.packages.starship} init fish | source
                ${lib.getExe pkgs.devenv} hook fish | source

                # Disabling autocd in cd command
                ${lib.concatLines ((lib.lists.take 5 cd-config) ++ [
                    ''
                        if test "$argv[1]" = '--'
                            echo 'Autocd is disabled via config, use cd for changing directories' >&2
                            return 1
                        end
                    ''
                ] ++ (lib.lists.drop 5 cd-config))}
            '';
        };
    };
}