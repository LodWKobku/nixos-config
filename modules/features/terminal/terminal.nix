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
            pkgs.devenv
        ];
        xdg.terminal-exec = {
            enable = true;
            settings = {
                default = [ "kitty.desktop" ];
            };
        };
        programs.starship = {
            enable = true;
            package = self.packages.${pkgs.stdenv.hostPlatform.system}.starship;
        };
        users.users.user.shell = self.packages.${pkgs.stdenv.hostPlatform.system}.fish;
        programs.fish = {
            enable = true;
            package = self.packages.${pkgs.stdenv.hostPlatform.system}.fish;
        };

    };

    perSystem = { pkgs, lib, self', ... }: {
        packages.kitty = inputs.wrapper-modules.wrappers.kitty.wrap {
            inherit pkgs;
            # Configuration from https://github.com/stefan-hacks/ikitty/
            font.name = "JetBrainsMono NFM";
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

            constructFiles.kittyDesktop = {
                content = (pkgs.makeDesktopItem {
                        type = "Application";
                        name = "kitty";
                        desktopName = "kitty";
                        genericName = "Terminal emulator";
                        comment = "Fast, feature-rich, GPU based terminal";
                        tryExec = "kitty";
                        startupNotify = true;
                        exec = "kitty";
                        icon = "kitty";
                        categories = [ "System" "TerminalEmulator" ];
                        keywords = [ "cmd" ];
                    }).text;
                relPath = "share/applications/kitty.desktop";
            };
        };
        packages.starship = inputs.wrapper-modules.wrappers.starship.wrap {
            inherit pkgs;
            preset = "catppuccin-powerline";
            settings.palette = "catppuccin_frappe";
        };
        packages.fish = inputs.wrapper-modules.wrappers.fish.wrap {
            inherit pkgs;
            runtimePkgs = [ 
                self'.packages.git
                pkgs.gh
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