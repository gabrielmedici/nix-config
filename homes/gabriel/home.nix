{config, pkgs, ...} : {
  home.username = "gabriel";
  home.homeDirectory = "/home/gabriel";

  home.stateVersion = "24.11";

  dconf = {
    enable = true;
    settings."org/gnome/desktop/interface".color-scheme = "prefer-dark";
    settings."org/gnome/shell" = {
      disable-user-extensions = false;
      enabled-extensions = with pkgs.gnomeExtensions; [
        hot-edge.extensionUuid
      ];
    };
  };

  programs.git = {
    enable = true;
    userEmail = "j.gabriel.medici@gmail.com";
    userName = "Gabriel Medici";
  };

  # home.packages = [];

  home.file = {
    ".config/hypr" = {
      source = config.lib.file.mkOutOfStoreSymlink ../common/dotfiles/.config/hypr;
    };
  };

  # home.sessionVariables = [];

  imports = [
    # ../common/modules/onedrive.nix
    ../common/modules/obs.nix
    # ../common/modules/hyprland.nix
  ];

  programs.home-manager.enable = true;
}