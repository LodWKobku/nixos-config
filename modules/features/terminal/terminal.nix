{ self, inputs, ... }: {
    flake.nixosModules.shell = { pkgs, lib, ... }: {
        imports = [
            self.nixosModules.aiCli
        ];
        home-manager.sharedModules = [
            self.homeModules.nix-init
        ];
        
        environment.systemPackages = with pkgs; [
            self.packages.${pkgs.stdenv.hostPlatform.system}.kitty
        ];
        programs.git = {
            enable = true;
            package = self.packages.${pkgs.stdenv.hostPlatform.system}.git;
        };
        
        xdg.terminal-exec = {
            enable = true;
            settings = {
                default = [ "kitty.desktop" ];
            };
        };
        users.users.user.shell = self.packages.${pkgs.stdenv.hostPlatform.system}.fish;
        programs.fish = {
            enable = true;
            package = self.packages.${pkgs.stdenv.hostPlatform.system}.fish;
        };

        

    };

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