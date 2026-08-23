{ self, inputs, ... }: {
    perSystem = { pkgs, lib, self', ... }: {
        packages.wayfire = inputs.wrappers.lib.wrapPackage {
            inherit pkgs;
            package = pkgs.wayfire;
            env.WAYFIRE_CONFIG_FILE = "${pkgs.writeText "wayfire.ini" (lib.generators.toINI {} {
                core = {
                    plugins = "alpha animate autostart command cube decoration expo fast-switcher fisheye foreign-toplevel grid gtk-shell idle invert move oswitch place resize session-lock shortcuts-inhibit switcher vswitch wayfire-shell window-rules wm-actions wobbly wrot zoom";
                    close_top_view = "<super> KEY_Q | <alt> KEY_F4";
                    vwidth = 3;
                    vheight = 3;
                    preferred_decoration_mode = "client";
                };

                move = {
                    activate = "<super> BTN_LEFT";
                };

                resize = {
                    activate = "<super> BTN_RIGHT";
                };

                zoom = {
                    modifier = "<super>";
                };

                alpha = {
                    modifier = "<super> <alt>";
                };

                wrot = {
                    activate = "<super> <ctrl> BTN_RIGHT";
                };

                fisheye = {
                    toggle = "<super> <ctrl> KEY_F";
                };

                autostart = {
                    "0_env" = "dbus-update-activation-environment --systemd WAYLAND_DISPLAY DISPLAY XAUTHORITY";
                    autostart_wf_shell = true;
                    outputs = "kanshi";
                    notifications = "mako";
                    gamma = "wlsunset";
                    idle = "swayidle before-sleep swaylock";
                    portal = "/usr/libexec/xdg-desktop-portal";
                };

                command = {
                    binding_terminal = "<super> KEY_ENTER";
                    command_terminal = "alacritty";
                    binding_launcher = "<super> <shift> KEY_ENTER";
                    command_launcher = "wofi";
                    binding_lock = "<super> <shift> KEY_ESC";
                    command_lock = "swaylock";
                    binding_logout = "<super> KEY_ESC";
                    command_logout = "wlogout";
                    binding_screenshot = "KEY_PRINT";
                    command_screenshot = "grim $(date '+%F_%T').webp";
                    binding_screenshot_interactive = "<shift> KEY_PRINT";
                    command_screenshot_interactive = "slurp | grim -g - $(date '+%F_%T').webp";
                    repeatable_binding_volume_up = "KEY_VOLUMEUP";
                    command_volume_up = "amixer set Master 5%+";
                    repeatable_binding_volume_down = "KEY_VOLUMEDOWN";
                    command_volume_down = "amixer set Master 5%-";
                    binding_mute = "KEY_MUTE";
                    command_mute = "amixer set Master toggle";
                    repeatable_binding_light_up = "KEY_BRIGHTNESSUP";
                    command_light_up = "light -A 5";
                    repeatable_binding_light_down = "KEY_BRIGHTNESSDOWN";
                    command_light_down = "light -U 5";
                };

                grid = {
                    slot_bl = "<super> KEY_KP1";
                    slot_b = "<super> KEY_KP2";
                    slot_br = "<super> KEY_KP3";
                    slot_l = "<super> KEY_LEFT | <super> KEY_KP4";
                    slot_c = "<super> KEY_UP | <super> KEY_KP5";
                    slot_r = "<super> KEY_RIGHT | <super> KEY_KP6";
                    slot_tl = "<super> KEY_KP7";
                    slot_t = "<super> KEY_KP8";
                    slot_tr = "<super> KEY_KP9";
                    restore = "<super> KEY_DOWN | <super> KEY_KP0";
                };

                switcher = {
                    next_view = "<alt> KEY_TAB";
                    prev_view = "<alt> <shift> KEY_TAB";
                };

                "fast-switcher" = {
                    activate = "<alt> KEY_ESC";
                };

                vswitch = {
                    binding_left = "<ctrl> <super> KEY_LEFT";
                    binding_down = "<ctrl> <super> KEY_DOWN";
                    binding_up = "<ctrl> <super> KEY_UP";
                    binding_right = "<ctrl> <super> KEY_RIGHT";
                    with_win_left = "<ctrl> <super> <shift> KEY_LEFT";
                    with_win_down = "<ctrl> <super> <shift> KEY_DOWN";
                    with_win_up = "<ctrl> <super> <shift> KEY_UP";
                    with_win_right = "<ctrl> <super> <shift> KEY_RIGHT";
                };

                cube = {
                    activate = "<ctrl> <alt> BTN_LEFT";
                };

                expo = {
                    toggle = "<super> KEY_E";
                    select_workspace_1 = "KEY_1";
                    select_workspace_2 = "KEY_2";
                    select_workspace_3 = "KEY_3";
                    select_workspace_4 = "KEY_4";
                    select_workspace_5 = "KEY_5";
                    select_workspace_6 = "KEY_6";
                    select_workspace_7 = "KEY_7";
                    select_workspace_8 = "KEY_8";
                    select_workspace_9 = "KEY_9";
                };

                oswitch = {
                    next_output = "<super> KEY_O";
                    next_output_with_win = "<super> <shift> KEY_O";
                };

                invert = {
                    toggle = "<super> KEY_I";
                };

                "wayfire-shell" = {
                    toggle_menu = "<super>";
                };
            })}";
        };
    };
}
