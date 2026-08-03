{ self, inputs, ... }: {
    perSystem = { pkgs, lib, self', ... }: {
        packages.qdirstat = (inputs.wrapper-modules.lib.wrapModule ({ pkgs, ... }: {
            package = pkgs.qdirstat;
        })).wrap {
            inherit pkgs;

            # Override the shipped desktop file so the app is always launched as root
            constructFiles.qdirstatDesktop = {
                content = (pkgs.makeDesktopItem {
                    type = "Application";
                    name = "qdirstat";
                    desktopName = "QDirStat";
                    genericName = "QDirStat Directory Statistics";
                    comment = "QDirStat Directory Statistics";
                    exec = "pkexec qdirstat %f";
                    icon = "qdirstat";
                    terminal = false;
                    mimeTypes = [ "inode/directory" "inode/mount-point" ];
                    categories = [ "Qt" "System" "Filesystem" ];
                    keywords = [ "directory" "tree" "size" "statistic" "disk" "space" ];
                }).text;
                relPath = "share/applications/qdirstat.desktop";
            };
        };
    };
}
