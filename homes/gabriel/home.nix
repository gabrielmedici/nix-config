{config, pkgs, ...} : {
  home.username = "gabriel";
  home.homeDirectory = "/home/gabriel";

  home.stateVersion = "25.05";

  home.packages = with pkgs; [
  ];

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
    ../common/modules/vscode.nix
    ../common/modules/ms-edge.nix
  ];

  xdg.desktopEntries = {
    edit-nix-config = {
      name = "Edit Nix Config with VSCode";
      exec = "code /etc/nixos/";
    };
  };

  programs.home-manager.enable = true;
}