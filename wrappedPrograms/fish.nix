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
            configFile.content = ''
                fish_config theme choose catppuccin-frappe
                ${lib.getExe self'.packages.starship} init fish | source
                ${lib.getExe pkgs.devenv} hook fish | source
            '';
        };
    };
}