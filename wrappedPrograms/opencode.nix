{ self, inputs, ... }: {
    perSystem = { pkgs, lib, self', ... }: {
        packages.opencode = inputs.wrapper-modules.wrappers.opencode.wrap {
            inherit pkgs;
            tui-settings = {
                "$schema"= "https://opencode.ai/tui.json";
                "theme"= "catppuccin-frappe";
            };
        };
    };
}