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
		configFile."kwinrc".Wayland = {
			# Autoenable fcitx5 digital keyboard (for chinese characters)
			"InputMethod" = {
				shellExpand = true;
				value = "/run/current-system/sw/share/applications/fcitx5-wayland-launcher.desktop";
			};
		};
		kwin.effects.shakeCursor.enable = false; # Disable shake cursor disability feature
		session.sessionRestore.restoreOpenApplicationsOnLogin = "startWithEmptySession"; # Disable automaticly restoring apps from last session

		overrideConfig = true;
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
						horizontal = 272;
						vertical = 15;
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
	
	#Stylix
	stylix.targets.kde.enable = true;
	gtk.gtk2.force = true;
}

