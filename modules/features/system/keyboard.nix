# Custom fcitx5 configuration
{ self, inputs, ... }: {
    flake.nixosModules.keyboard = { pkgs, lib, ... }: {
        services.xserver.xkb = {
            layout = "us";
            variant = "";
        };

        i18n.inputMethod = {
            type = "fcitx5";
            enable = true;
            fcitx5 = {
            waylandFrontend = true;
            ignoreUserConfig = true;
            addons = with pkgs; [
                fcitx5-gtk             # alternatively, kdePackages.fcitx5-qt
                qt6Packages.fcitx5-chinese-addons  # table input method support
                fcitx5-m17n # Pinyin tones support
                fcitx5-nord            # a color theme
            ];
            settings.inputMethod = {
                # Group 1
                GroupOrder."0" = "Default";
                "Groups/0" = {
                Name = "Default";
                "Default Layout" = "us";
                DefaultIM = "keyboard-pl";
                };
                "Groups/0/Items/0".Name="keyboard-pl";

                # Group 2 (for chinese)
                GroupOrder."1" = "Chinski";
                "Groups/1" = {
                Name = "Chinski";
                "Default Layout" = "us";
                DefaultIM = "m17n_zh_pinyin";
                };
                "Groups/1/Items/0".Name="pinyin";
                "Groups/1/Items/1".Name="m17n_zh_pinyin";
            };
            settings.globalOptions = {
                "Hotkey" = {
                EnumerateWithTriggerKeys="True";
                EnumerateSkipFirst="False";
                ModifierOnlyKeyTimeout="250";
                };
                "Hotkey/TriggerKeys" = {
                "0"="Alt+Shift+Shift_R";
                "1"="Zenkaku_Hankaku";
                "2"="Hangul";
                };
                "Hotkey/ActivateKeys" = {
                "0"="Hangul_Hanja";
                };
                "Hotkey/DeactivateKeys" = {
                "0"="Hangul_Romaja";
                };
                "Hotkey/AltTriggerKeys" = {
                "0"="Shift_L";
                };
            };
            };
        };

        # Select internationalisation properties.
        i18n.defaultLocale = "en_US.UTF-8";

        i18n.extraLocaleSettings = {
            LC_ADDRESS = "pl_PL.UTF-8";
            LC_IDENTIFICATION = "pl_PL.UTF-8";
            LC_MEASUREMENT = "pl_PL.UTF-8";
            LC_MONETARY = "pl_PL.UTF-8";
            LC_NAME = "pl_PL.UTF-8";
            LC_NUMERIC = "pl_PL.UTF-8";
            LC_PAPER = "pl_PL.UTF-8";
            LC_TELEPHONE = "pl_PL.UTF-8";
            LC_TIME = "pl_PL.UTF-8";
        };
    };
}