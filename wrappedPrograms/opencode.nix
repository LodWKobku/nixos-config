{ self, inputs, ... }: {
    perSystem = { pkgs, lib, self', ... }: {
        packages.opencode = inputs.wrapper-modules.wrappers.opencode.wrap {
            inherit pkgs;
            # settings.tui = {
            #     # "$schema"= "https://opencode.ai/tui.json";
            #     "theme"= "tokyonight";
            # };
            env.OPENCODE_TUI_CONFIG = "${pkgs.writeText "tui.json" (builtins.toJSON {
                "$schema"= "https://opencode.ai/tui.json";
                "theme"= "catppuccin-frappe";
            })}";
        };
    };
}