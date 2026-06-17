{ self, inputs, ... }: {
    flake.nixosModules.plasma = { pkgs, lib, config, ... }: {
        services.displayManager.sddm.enable = true;
        services.desktopManager.plasma6.enable = true;
        
        home-manager.sharedModules = [
            inputs.plasma-manager.homeModules.plasma-manager
            self.homeModules.plasma-manager
        ];
        
        # Disable default kde terminal
        environment.plasma6.excludePackages = with pkgs; [
            kdePackages.konsole
        ];

    };

    flake.homeModules.plasma-manager = { pkgs, ... }: {
        programs.plasma = {
            enable = true;
            configFile."kwinrc".Wayland = {
                # Autoenable fcitx5 digital keyboard (for chinese characters)
                "InputMethod" = {
                    shellExpand = true;
                    value = "/run/current-system/sw/share/applications/fcitx5-wayland-launcher.desktop";
                };
            };
            kwin.effects.shakeCursor.enable = false; # Disable shake cursor disability feature
            session.sessionRestore.restoreOpenApplicationsOnLogin = "startWithEmptySession"; # Disable automaticly restoring apps from last session
            
            kscreenlocker = {
                autoLock = false;
                lockOnResume = false;
                timeout = 0;
            };
            powerdevil = {
                AC.autoSuspend.action = "nothing";
                battery.autoSuspend.action = "nothing";
                
            };

            # overrideConfig = true;
            # resetFiles = ["plasma-org.kde.plasma.desktop-appletsrc"];
            desktop = { #Customize desktop
                widgets = [
                    {	# Digital clock
                        config = {
                            Appearance = {
                                showDate = true;
                            };
                        };
                        name = "org.kde.plasma.digitalclock";
                        position = {
                            horizontal = 1296;
                            vertical = 47;
                        };
                        size = {
                            height = 400;
                            width = 368;
                        };
                    }
                ];
            };
            
            # panels = [ # Customize panel
            #     {
            #         location = "bottom";
            #         lengthMode = "fill";
            #         widgets = [
            #             "org.kde.plasma.kickoff"
            #             "org.kde.plasma.pager"
            #             "org.kde.plasma.icontasks"
            #             "org.kde.plasma.marginsseparator"
            #             "org.kde.plasma.systemtray"
            #             "org.kde.plasma.digitalclock"
            #             "org.kde.plasma.showdesktop"
            #         ];
            #     }
            # ];
        };
    };
}
