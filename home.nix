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
			# Autoenable fcitx5 digital keyboard (for chinese characters)
			Wayland."InputMethod[$e]" = "/run/current-system/sw/share/applications/org.fcitx.Fcitx5.desktop";
		};
		kwin.effects.shakeCursor.enable = false; # Disable shake cursor disability feature
		
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
						horizontal = 176;
						vertical = 64;
					};
					size = {
						height = 250;
						width = 250;
					};
				}
			];
		};

		panels = [ # Customize panel
			{
				location = "bottom";
				lengthMode = "fill";
				widgets = [
					"org.kde.plasma.kickoff"
					"org.kde.plasma.pager"
					"org.kde.plasma.icontasks"
					"org.kde.plasma.marginsseparator"
					"org.kde.plasma.systemtray"
					"org.kde.plasma.digitalclock"
					"org.kde.plasma.showdesktop"
				];
			}
		];

	};
	gtk.gtk2.force = true;

	#Stylix
	stylix.targets.kde.enable = true;
}

