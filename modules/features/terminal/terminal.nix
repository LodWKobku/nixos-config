{ self, inputs, ... }: {
    flake.nixosModules.shell = { pkgs, lib, ... }: {
        imports = [
            self.nixosModules.aiCli
            self.nixosModules.devenv
            self.nixosModules.git
        ];
        home-manager.sharedModules = [
            self.homeModules.nix-init
        ];
        
        environment.systemPackages = with pkgs; [
            self.packages.${pkgs.stdenv.hostPlatform.system}.kitty
        ];
        programs.starship = {
            enable = true;
            package = self.packages.${pkgs.stdenv.hostPlatform.system}.starship;
        };
    };

    perSystem = { pkgs, lib, self', ... }: {
        packages.kitty = inputs.wrapper-modules.wrappers.kitty.wrap {
            inherit pkgs;
            # Configuration from https://github.com/stefan-hacks/ikitty/
            settings = {
                repaint_delay = 10;
                input_delay = 3;
                sync_to_monitor = "yes";
                confirm_os_window_close = 0; 
                # Cursor
                cursor_trail = 3;
                cursor_trail_decay = "0.1 0.4";
                # Transparency
                background_opacity = 0.95;
                inactive_text_alpha = 0.7;
                background_blur = 1;
                # Spacing
                window_margin_width = 5;
                single_window_margin_width = 0;
                window_padding_width = 2; 
                # TODO
            };
            themeFile = "Catppuccin-Frappe";
        };
        packages.starship = inputs.wrapper-modules.wrappers.starship.wrap {
            inherit pkgs;
            preset = "catppuccin-powerline";
            settings.palette = "catppuccin_frappe";
        };
    };
}