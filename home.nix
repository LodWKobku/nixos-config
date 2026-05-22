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
	programs.gh = {
		enable = true;
		gitCredentialHelper = {
			enable = true;
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
				# Dev containters
				ms-vscode-remote.remote-containers 
				mkhl.direnv	
			];
			userSettings = {
				"workbench.iconTheme" = "catppuccin-frappe";
				"chat.disableAIFeatures" = true;
			};
		};
	};

	#Discord
	programs.discord = {
		enable = true;
		package = pkgs.discord;
		settings.SKIP_HOST_UPDATE = true;
	};

	#Fastfetch
	programs.fastfetch.enable = true;
	

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
						horizontal = 1296;
						vertical = 47;
					};
					size = {
						height = 400;
						width = 368;
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
	#Desktop Files
	home.file."Desktop/Steam.desktop".source = "${pkgs.steam}/share/applications/steam.desktop";
	home.file."Desktop/Heroic Game Launcher.desktop".source = "${pkgs.heroic}/share/applications/com.heroicgameslauncher.hgl.desktop";
	home.file."Desktop/PrismLauncher.desktop".source = "${pkgs.prismlauncher}/share/applications/org.prismlauncher.PrismLauncher.desktop";
	home.file."Desktop/Discord.desktop".source = "${pkgs.discord}/share/applications/discord.desktop";
	
	#Stylix
	stylix.targets.kde.enable = true;
	gtk.gtk2.force = true;
}

