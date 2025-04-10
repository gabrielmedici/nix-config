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

  nixpkgs.config = import ./nixpkgs.config.nix;
  xdg.configFile."nixpkgs/config.nix".source = ./nixpkgs.config.nix;

  imports = [
    # ../common/modules/onedrive.nix
    ../common/modules/obs.nix
    ../common/modules/spicetify.nix
    ../common/modules/direnv.nix
  ];

  xdg.desktopEntries = {
    edit-nix-config = {
      name = "Edit Nix Config with VSCode";
      exec = "code /etc/nixos/";
    };
  };

  programs.home-manager.enable = true;
}