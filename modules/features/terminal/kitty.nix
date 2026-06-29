{ self, inputs, ... }: {
    perSystem = { pkgs, lib, self', ... }: {
        packages.kitty = inputs.wrapper-modules.wrappers.kitty.wrap {
            inherit pkgs;
            # Configuration based on https://github.com/stefan-hacks/ikitty/
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

            # Adding alias "cmd" to desktop file for convinience
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
    };
}