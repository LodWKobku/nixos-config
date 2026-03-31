{ config, lib, pkgs, ... }:

{
	home.username = "user";
 	home.homeDirectory = "/home/user";
	home.stateVersion = "25.11";

	programs.git = {
		enable = true;
		settings.user = {
			name  = "LodWKobku";
			email = "lodwkobku@gmail.com";
		};
	};

	#VS Code
	programs.vscode = {
		enable = true;
		profiles.default = {
			extensions = with pkgs.vscode-extensions; [
			mhutchie.git-graph
			ms-python.python
			bbenoist.nix
			catppuccin.catppuccin-vsc-icons
			];
			userSettings = {
				"workbench.iconTheme" = "catppuccin-frappe";
			};
		};
	};

	#Plasma
	programs.plasma = {
		enable = true;
		configFile.kwinrc = {
			Wayland."InputMethod[$e]" = "/run/current-system/sw/share/applications/org.fcitx.Fcitx5.desktop";
			"Module-gtkconfig"."autoload" = false;
		};
	};
	# Remove clogged backup .gtkrc2 file before rebuilding 
	home.activation.deleteGtkrc2 = lib.hm.dag.entryBefore ["writeBoundary"] ''
		if [ -f "${config.home.homeDirectory}/.gtkrc-2.0.backup ]; then
			rm -f "${config.home.homeDirectory}/.gtkrc-2.0.backup"
		fi
	'';

	#Stylix
	stylix.targets.kde.enable = true;
}

