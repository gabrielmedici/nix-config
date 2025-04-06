{config, pkgs, ...} : {
  home.username = "gabriel";
  home.homeDirectory = "/home/gabriel";

  home.stateVersion = "24.11";

  home.packages = with pkgs; [
    gnomeExtensions.dash-to-dock
  ];

  dconf = {
    enable = true;
    settings."org/gnome/desktop/interface".color-scheme = "prefer-dark";
    settings."org/gnome/shell" = {
      disable-user-extensions = false;
      enabled-extensions = with pkgs.gnomeExtensions; [
        dash-to-dock.extensionUuid
      ];
    };
  };

  programs.git = {
    enable = true;
    userEmail = "j.gabriel.medici@gmail.com";
    userName = "Gabriel Medici";
  };

  # home.file = {};

  # home.sessionVariables = [];

  imports = [
    # ../common/modules/onedrive.nix
    ../common/modules/obs.nix
  ];

  programs.home-manager.enable = true;
}