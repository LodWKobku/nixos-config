{ self, inputs, ... }: {
    perSystem = { pkgs, lib, self', ... }: {
        # Config based on https://github.com/ExploitCraft/fastfetch-config/blob/main/config.jsonc
        packages.fastfetch = inputs.wrapper-modules.wrappers.fastfetch.wrap {
            inherit pkgs;
            settings = {
                "$schema" =  "https://github.com/fastfetch-cli/fastfetch/raw/dev/doc/json_schema.json";
                "modules" = [
                    # Title
                    {
                        "type"= "title";
                        "format"= "{#1}╭───────────── {#}{user-name-colored}";
                    }
                    # System Information
                    {
                        "type"= "custom";
                        "format"= "{#1}│ {#}System Information";
                    }
                    {
                        "type"= "os";
                        "key"= "{#separator}│  {#keys}󰍹 OS";
                    }
                    {
                        "type"= "kernel";
                        "key"= "{#separator}│  {#keys}󰒋 Kernel";
                    }
                    {
                        "type"= "uptime";
                        "key"= "{#separator}│  {#keys}󰅐 Uptime";
                    }
                    {
                        "type"= "packages";
                        "key"= "{#separator}│  {#keys}󰏖 Packages";
                        "format"= "{all}";
                    }
                    {
                        "type"= "custom";
                        "format"= "{#1}│";
                    }
                    # Desktop Environment
                    {
                        "type"= "custom";
                        "format"= "{#1}│ {#}Desktop Environment";
                    }
                    {
                        "type"= "de";
                        "key"= "{#separator}│  {#keys}󰧨 DE";
                    }
                    {
                        "type"= "wm";
                        "key"= "{#separator}│  {#keys}󱂬 WM";
                    }
                    {
                        "type"= "shell";
                        "key"= "{#separator}│  {#keys}󰞷 Shell";
                    }
                    {
                        "type"= "custom";
                        "format"= "{#1}│";
                    }
                    # Hardware Information
                    {
                        "type"= "custom";
                        "format"= "{#1}│ {#}Hardware Information";
                    }
                    {
                        "type"= "cpu";
                        "key"= "{#separator}│  {#keys}󰻠 CPU";
                    }
                    {
                        "type"= "gpu";
                        "key"= "{#separator}│  {#keys}󰢮 GPU";
                    }
                    {
                        "type"= "memory";
                        "key"= "{#separator}│  {#keys}󰍛 Memory";
                    }
                    {
                        "type"= "disk";
                        "key"= "{#separator}│  {#keys}󰋊 Disk (/)";
                        "folders"= "/";
                    }
                    {
                        "type"= "custom";
                        "format"= "{#1}│";
                    }
                    #  Footer
                    {
                        "type"= "custom";
                        "format"= "{#1}╰───────────────────────────────╯";
                    }
                ];
            };
        };
    };
}