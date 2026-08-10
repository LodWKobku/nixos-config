{ self, inputs, ... }: {
    perSystem = { pkgs, lib, self', ... }: {
        packages.qdirstat = inputs.wrappers.lib.wrapPackage {
            inherit pkgs;
            package = pkgs.qdirstat;
            # Run qdirstat as sudo by default
            exePath = "${lib.getExe' pkgs.lxqt.lxqt-sudo "lxqt-sudo"} -q ${lib.getExe pkgs.qdirstat}";
        };
    };
}
